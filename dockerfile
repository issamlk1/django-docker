# ================================
# Base stage - shared dependencies
# ================================
FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# ================================
# Development stage
# ================================
FROM base AS development

# Install dev tools (vim, zsh, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    zsh \
    wget \
    git \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Oh-My-Zsh
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Developer aliases
RUN echo 'alias py="python manage.py"' >> ~/.zshrc && \
    echo 'alias pym="python manage.py migrate"' >> ~/.zshrc && \
    echo 'alias pys="python manage.py runserver 0.0.0.0:8000"' >> ~/.zshrc && \
    echo 'alias pysh="python manage.py shell"' >> ~/.zshrc && \
    echo 'alias pyt="python manage.py test"' >> ~/.zshrc

# Copy requirements and install
COPY requirements*.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy project
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# ================================
# Production stage (lean & mean)
# ================================
FROM base AS production

# Copy requirements and install (production only)
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gunicorn

# Copy project
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput || true

EXPOSE 8000

# Use gunicorn for production
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]