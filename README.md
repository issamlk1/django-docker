# Django-Dock

> Django Docker

> For making new projects with docker and django without using virtual environment 

> Easy way to combine django and docker containers


## Installation

- First - Clone this repo to your local machine using `https://github.com/issamlk1/docker-python`
- Then optimize the dockerfile and choose your database (Default postgresql)
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



## FAQ

- **How do I do *specifically* so and so?**
    - No problem! Just do this.

---

## Support

Reach out to me at one of the following places!

- Website at <a href="http://mlk1.com" target="_blank">`mlk1.com`</a>
- Twitter at <a href="https://twitter.com/ISSAM_ABBAS" target="_blank">`@issam_abbas`</a>

---


---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="http://mlk1.com" target="_blank">mlk1</a>.

