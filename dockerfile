# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.7

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container, my project needed buildeey name but you can name it what ever you want
# You can change the name buildeey to what ever you want
RUN mkdir /buildeey


#test for cash to make it faster in build
ADD ./requirements.txt /buildeey/requirements.txt


# Install any needed packages specified in requirements.txt
RUN pip install -r /buildeey/requirements.txt

# Set the working directory to /buildeey/
WORKDIR /buildeey/

# Copy the current directory contents into the container at /buildeey/
ADD . /buildeey/



# Yes I am crazy about good looking code, I cant handle it
RUN apt-get update && apt-get install -y \
      vim \
      zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true


#RUN echo 'alias py="python manage.py"' >> ~/.bashrc
RUN echo 'alias py="python manage.py"' >> ~/.zshrc




