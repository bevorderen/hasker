# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": "otus",
        "USER": "otus_user",
        "PASSWORD": "111111",
        "HOST": "127.0.0.1",
        "PORT": "5432"
    }
}
