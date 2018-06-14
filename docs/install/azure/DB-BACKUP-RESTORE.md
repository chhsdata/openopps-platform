We're running the database out of Docker Compose for the pilot. I don't fully trust Docker Compose with databases. Therefore, we need a more robust means of backing up and restoring our data.

# Pre-work

All of the following commands need to be entered into the command line on Azure, and require the app be up and running in Docker. First, go into the openopps project directory.

```sh
cd /home/openopps/openopps-platform
```

To check which services are running within Docker, run the following.

```sh
docker-compose ps
```

If the list is empty, or if all services are listed as *Exit*, that means your app is not running. Go ahead and run `npm run docker:up` to bring the app back up. Re-run `docker-compose ps` when ready.

# Backing up

There's an npm script for backing up the database. **Note that this command will only work in Linux; it barfs when you try it on Windows.**

```sh
npm run docker:db:backup
```

This will create a full backup of the database at the current point in time. Weekly backups of the database can be found in the following directory on our Azure instance: `/home/openopps/db-backups`.

# Disconnecting

Before dropping or restoring a database, it's important to shut down any services that are connected to the database. We can check with the following command.

```sh
docker-compose ps
```

Check to see if `app`, `init_db`, and/or `migrate_db` are listed as *Up*. If so, you'll need to bring them down before doing any database restoration. Run whichever of the following commands are needed.

```sh
docker-compose stop app
docker-compose stop init_db
docker-compose stop migrate_db
```

Meanwhile, if `db` is listed as *Exit*, then you'll need to bring it back up.

```sh
docker-compose start db
```

# Dropping

If you need to delete the database for whatever reason, here's the command to do it. **Proceed with caution.**

```sh
docker-compose exec db psql -U midas -c 'DROP DATABASE midas'
```

# Restoring

Finally, the next command will restore the database from a backup. `{{FILENAME}}` should be replaced with the name of the backup file from which you would like to restore the database.

```sh
docker-compose exec -i db pg_restore -U midas -C -d postgres < /home/openopps/db-backups/{{FILENAME}}.dump
```

# Running

Once the database is restored, restart the app.

```sh
docker-compose start app
```

# Fin

This should put us in an acceptable position for the pilot.
