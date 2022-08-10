## For manual install
### Init DB
```commandline
psql --username postgres -c "CREATE ROLE otus_user WITH PASSWORD '111111' LOGIN;"
createdb --username postgres --owner otus_user otus
```

### Create and apply migrations
```commandline
python3 manage.py makemigrations
python3 manage.py migrate
```

## Auto install
### Warning
All db command will be run from postgres user. You need to:
1. Set the password for user postgres:
```commandline
sudo -i -u postgres
psql
ALTER USER postgres with encrypted password 'xxxxxxx';
exit
exit
```
2. Edit the pg_hba.conf file:
````commandline
sudo nano /etc/postgresql/{your_version}/main/pg_hba.conf
and change "peer" to "md5" on the line concerning postgres:
````

3. Restart the database:
```commandline
sudo /etc/init.d/postgresql restart
```

### Run project
```commandline
make prod
```

## Available users
username: admin12
password: sdfdsf23D

username: admin5
password: sdfdsf23D
