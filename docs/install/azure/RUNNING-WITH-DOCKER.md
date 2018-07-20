# Running with Docker

Open Opportunities is configured to take advantage of Docker, a great tool which allows developers to automatically assemble and run all of an app's dependencies. In our case, Docker can do a whole lot, including the following.

* Download a Linux operating system, similar to what would be used on a web server.
* Run that Linux OS within Docker, even if you're using a Windows-based workstation.
* Configure Linux to meet all requirements for running Open Opps.
* Configure the Open Opps app as needed.
* Set up and run additional services in the same manner, such as the database.
* Orchestrate communications between said systems.
* Secure the whole system from interacting with your desktop, but...
* ...allow a few controlled points of contact, such as allowing your web browser to view the app on a specific port.

All of this can be accomplished by running a couple commands, sitting back, and enjoying the show. Here are the commands for running Open Opps with Docker.

## Prerequisites

If running these commands on your workstation, you'll need to install some software beforehand.

* Docker
* Node.js
* Git

This will all go way more smoothly if you're blessed with a Mac or Linux desktop. Windows will work, but it's a second-class citizen when working with these tools.

If running these commands on our Azure-based server, you'll want to read [Install Azure](INSTALL-AZURE.md) for the complete picture.

## Setting the table

Once you've installed the required software, you'll need to open your command line. This is usually called the `Terminal` on Mac or Linux. On Windows, `cmd.exe` will work, but free alternatives like [cmder](http://cmder.net/) or [Git Bash](https://gitforwindows.org/) are preferred. With your command line open, navigate to the Documents folder.

```sh
cd Documents
```

Use Git to download the code into your Documents folder.

```sh
git clone https://github.com/xjensen/openopps-platform.git
```

Navigate into the newly created folder with our Open Opps code.

```sh
cd openopps-platform
```

Finally, switch into the `docker-azure` branch of the codebase.

```sh
git checkout docker-azure
```

When you installed Node.js, you also got a tool called `npm`. We can use `npm` to install some Javascript dependencies on our workstation. This will help us run npm's scripts, which you'll see in a moment.

```sh
npm install
```

(Note that you may need to add `sudo` on some Linux systems: `sudo npm install`.)

## Running Docker through npm

You're now ready to *build* the *images* for Open Opps, with Docker.

```sh
npm run docker:build
```

This command will use a Docker tool, called Docker Compose, to prepare images for each of our services. Depending upon the service, one of two things might happen.

* Some of our services, like our PostgreSQL and Redis databases, are just using public, pre-built images. In these cases, the images will simply be downloaded from the online [Docker Hub](https://hub.docker.com/) service.
* Some of our services, such as Open Opps itself, will need to be built from our code. Docker will construct these images based upon the `Dockerfile` which lives at the root of our project.

https://github.com/xjensen/openopps-platform/blob/docker-azure/Dockerfile

Either way, you'll need to wait. This can take several minutes on first run. On subsequent runs, it will be much quicker because Docker is good about caching downloaded component parts.

Next, run the app.

```sh
npm run docker:up
```

This will again use Docker Compose to create virtual machine-like things called *containers*, and run our images inside.

If all is well, your app should be running. The following command will report the status of each container.

```sh
npm run docker:ps
```

You'll see something like the following.

```sh
Name                                 Command                          State      Ports
-------------------------------------------------------------------------------------------------------------
openopps-platform-dev_app_1          /wait-for-migrate-db-conta ...   Up         0.0.0.0:3000->3000/tcp
openopps-platform-dev_app_2          /wait-for-migrate-db-conta ...   Exit 128
openopps-platform-dev_db_1           docker-entrypoint.sh postgres    Up         5432/tcp
openopps-platform-dev_init_db_1      /wait-for-migrate-db-conta ...   Exit 0
openopps-platform-dev_mail_1         mailcatcher --foreground - ...   Up         25/tcp, 0.0.0.0:8025->80/tcp
openopps-platform-dev_migrate_db_1   npm run migrate:up               Exit 0
openopps-platform-dev_redis_db_1     docker-entrypoint.sh redis ...   Up         6379/tcp
```

*Up* means the corresponding service is running. *Exit 0* means the service is not running, but quit on good terms, so is probably working as expected. An *Exit* above *0* probably means something is broken. Oops!

You can also check log output with the following command.

```sh
npm run docker:logs
```

This will trail the logs, so you can work and see resulting changes within the app in real time. To exit the logs, press `Ctrl-c`.

By the way, if you want to work with the site in development, you can visit the following URL.

http://localhost:3000/

When it's time to bring the app down, this will do it.

```sh
npm run docker:down
```

## Setting npm's environment

If you're running Open Opps in development mode on your workstation, then you can skip this.

First, some background. All of our `npm` scripts for Docker usage can be found in the `package.json` file at the root of our project.

https://github.com/xjensen/openopps-platform/blob/docker-azure/package.json

These scripts call the `docker-compose.yml`, `docker-compose.dev.yml`, and `docker-compose.azure.yml` files. The base `docker-compose.yml` file contains common settings that run in all environments, while the `dev` and `azure` files provide overrides and additions specific to those environments. Running Docker through our `npm` scripts will magically take care of these details for you, as long as your npm configurations are correctly set.

The configuration we're worried about is `environment`, and the default is set in the `package.json` file like so.

```json
"config": {
  "environment": "dev"
}
```

See, this is why you don't need to worry if you're working in development. The default is already set to `dev`.

In Azure, you'll need to override this default value for `environment` in `npm`. From your command line, you can enter the following.

```sh
npm config set openopps-platform:environment azure
```

If you need to remove this later for whatever reason, the following command will delete it.

```sh
npm config delete openopps-platform:environment
```

## A note on the real world

Most tutorials and documents on Docker and Docker Compose will not use the `npm` commands described here. Our `npm` commands are specifically configured as a convenience for use with Open Opportunities. The real commands can be found in the root-level `package.json` file. Most of what you learn here will map fairly well to the actual Docker and Compose commands, just be aware that you'll be using `docker` or `docker-compose`, not `npm`, on most other projects.

## Advanced usage

While Docker Compose offers many capabilities, we've only mapped the most common within our `package.json` file. But we have a trick up our sleeve. If you need to run other Docker Compose commands, here's how.

```sh
npm run docker:base -- {command}
```

For example, if we wanted to run the [config](https://docs.docker.com/compose/reference/config/) command, we'd enter the following.

```sh
npm run docker:base -- config
```

An important use will be Docker's [exec](https://docs.docker.com/compose/reference/exec/), which can be used to execute commands inside a container. For instance, if we wanted to look directly inside the Postgres database, we could run the following command.

```sh
npm run docker:base -- exec db psql -U midas
```

`exec` is the Docker command, `db` is the service we want to target (as defined in the `docker-compose.yml` file), and `psql -U midas` is the command we want to insert into `db`. (Enter `\q` to exit the `psql` tool.)

Another great example is the following, which would allow you to enter the Linux shell (a.k.a. command line) for the `app` service.

```sh
npm run docker:base -- exec app bash
```

(Enter `exit` to end this `bash` session.)
