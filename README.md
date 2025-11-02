# Django-Docker

> Django Docker start up project 

> For making new projects with docker and django without using virtual environment 
> Now included vite, postcss, bun, tailwindcss



## Installation

- First - Clone this repo to your local machine  `git clone https://github.com/issamlk1/django-docker`
- Create .env file and fill it, it's content is inside the file .env.example for development enviroment
- Open terminal from the project file and follow the next steps
---

## Start new project
First build the docker file
```shell
$ docker compose build
```
Then create the new project
```shell
$ sudo docker compose run web django-admin startproject config .
```
---

### Setup
- After building the project you need to edit sittings.py to your new database information

> change /settings.py From

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```
> If you kept the postgresql it should look like this (its better to use the .env)

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'myproject',
        'USER': 'postgres',
        'PASSWORD' : 'postgres',
        'HOST': 'postgresql',
        'PORT': 5432,
    }
}
```
---

## Start the App

```shell
$ docker compose up -d
```

---

## Shut down

```shell
$ docker compose down
```
---

## Access the containers
- To access the docker containers just type this command in your terminal

> django
```shell
$ docker compose exec -it django zsh 
```

> postgresql
```shell
$ docker compose exec -it postgresql bash
```
---

## Important
- If you added new django packages to your projects make sure to run following command from inside the django container before shutting down 
   

```shell
$ pip freeze > requirements.txt
```

> Then before running the project again build the project again to download your packages
```shell
$ docker compose build web
```
---

## FAQ

- **How do I use *mysql* database?**
    - I removed the mysql example from the project, maybe I'll add it later.

---

## Support

Reach out to me at one of the following places!

- Website at <a href="http://mlk1.com" target="_blank">`mlk1.com`</a>

---




## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="http://mlk1.com" target="_blank">mlk1</a>.

