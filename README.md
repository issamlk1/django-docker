# Django-Docker

> Django Docker 

> For making new projects with docker and django without using virtual environment 

> Easy way to combine django and docker 


## Installation

- First - Clone this repo to your local machine  `git clone https://github.com/issamlk1/django-docker`
- Then optimize the `dockerfile` and choose your database (Default postgresql)
- Change all the "yourprojectname" to your project name
- Open terminal from the project file and follow the next steps

---

## After optimization

```shell
$ docker-compose build
$ sudo docker-compose run django django-admin startproject yourprojectname .
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

## Shutting down
- To shut down the docker container just type this in the terminal

```shell
$ docker-compose down
```
---

## Access the containers
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

## Important
- If you added new django packages to your projects make sure to run following command from django bash before shutting down 
   

```shell
$ pip freeze > requirements.txt
```

> Then before running the project again build the project again to download your packages
```shell
$ docker-compose build django
```
---

## FAQ

- **How do I use *mysql* database?**
    - Inside the docker-compose file you will find comments that will guide you throgh the proccess, don't forget to uncomment the mysqlclient inside requirements.txt file.

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

