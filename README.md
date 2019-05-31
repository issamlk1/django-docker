# Django-Dock

> Django Docker

> For making new projects with docker and django without using virtual environment 

> Easy way to combine django and docker containers


## Installation

- First - Clone this repo to your local machine using `https://github.com/issamlk1/django-docker`
- Then optimize the `dockerfile` and choose your database (Default postgresql)
- IF you changed anything in the `dockerfile` make sure that you check `requirements.txt` and optimize it too.
- Open termenal from the local file and follow the next steps

---

## After optimization

```shell
$ sudo docker-compose run web django-admin startproject yourprojectname .
$ docker-compose build
```
---

### Setup
- After building the project you need to edit sittings.py to your new database information

> change /yourprojectname/settings.py

> From

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```
> If you kept the postgresql it should be like this

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'yordatabasename',
        'USER': 'postgres',
        'PASSWORD' : 'postgres',
        'HOST': 'postgresql',
        'PORT': 5432,
    }
}
```
---

## Getting Started
- After finishing all the steps above you can start using django by 

```shell
$ docker-compose up django
```

> If you want it to run background replace it with this
```shell
$ docker-compose up -d django
```
---

## ٍShutting down
- To shut down the docker container just type this in the terminal

```shell
$ docker-compose down
```
---

## ٍAccess the containers
- To access the docker containers just type this command in your terminal

> django
```shell
$ docker-compose exec -it django bash
```

> postgresql
```shell
$ docker-compose exec -it postgresql bash
```
---

## FAQ

- **How do I use *mysql* database?**
    - I will provide more explanation soon for this topic.

---

## Support

Reach out to me at one of the following places!

- Website at <a href="http://mlk1.com" target="_blank">`mlk1.com`</a>
- Twitter at <a href="https://twitter.com/ISSAM_ABBAS" target="_blank">`@issam_abbas`</a>

---




## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="http://mlk1.com" target="_blank">mlk1</a>.

