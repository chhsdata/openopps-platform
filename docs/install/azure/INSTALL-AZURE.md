Here's everything you'll need to know about how Open Opps is installed on Azure.

# DEV

The current DEV instance of CA Open Opps uses Azure's standard Ubuntu Server 16.04 LTS image (provided by Canonical). We will simply use Docker CE and Docker Compose to host the application within this instance of Ubuntu. It's sloppy and unfit for real users, but we can use it to educate and get started on the product roadmap, etc.

These instructions will change, substantially, as the project matures.

## Prerequisites

* A copy of [Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) installed on your workstation.

## Procedure

We'll first create the Virtual Machine (VM) within Azure. We'll then make sure we can connect to this new VM. Once inside, we'll set-up the Ubuntu Linux OS for our needs. Finally, we'll install and run Open Opportunities.

### Creating the VM

The first step is to create the Virtual Machine on Azure.

1. Log into the [Azure Portal](https://portal.azure.us).
2. Go ahead and add a new Virtual Machine. Use *Ubuntu Server 16.04 LTS* (provided by Canonical) as your base.
3. After choosing to add the Ubuntu VM, you'll need to enter some intital configurations. The *Basic* section should be fairly straight-forward; I can provide a screenshot of our configs, along with the username/password, if needed.
4. Choose the smallest VM in the *Size* section, currently *DS1_v2*.
5. Within the third section, *Settings*, leave all the defaults alone and proceed.

### Connecting to the VM

Neat, we have a new Ubuntu VM on Azure. Let's get inside and take a look around.

6. Still within the Azure Portal, select the new VM. Current name: *OpenOpportunitiesDEV*.
7. Click the *Connect* button.
8. You'll see a field called *Login using VM local account*. Copy the contents of this field. It will look something like the following.

```sh
ssh {{VM username}}@{{VM URL/IP Address Here}}
```
9. Now would be a good time to open up your command line application. Make sure you've already installed Azure CLI 2.0 as mentioned under the prerequisites.
10. At the command prompt, enter the above command from the *Login using VM local account* field in Azure Portal. Here it is again, for posterity.

```sh
ssh {{VM username}}@{{VM URL/IP Address Here}}
```

11. Enter the password, as configured when creating the VM in the Azure Portal.

### Setting up Ubuntu

With any luck, you'll now see Ubuntu's command prompt. It might look something like the following.

```sh
openopps@OpenOpportunitiesDEV:~$
```

With most fresh Linux installations, it's important to set up non-root user accounts, permissions, etc. But it looks like Azure did all of that for us. Thank you, Azure. We can now proceed to the rest of our dark work.

#### Enable Ubuntu firewall

12. Before we turn on the firewall, we need to allow SSH a pass. This will allow us to do the things we need to do.

```sh
sudo ufw allow OpenSSH
```

13. Now, enable the firewall.

```sh
sudo ufw enable
```

You can check the status afterwards with the following.

```sh
sudo ufw status
```

#### Install Docker (yeah!)

Ubuntu Linux is based on Debian Linux, which means we use Debian's APT services to install software. In most situations, we would get this software directly from Debian's repositories.

But for Docker, we want the latest and greatest, so Debian's repositories won't cut the mustard. Instead, we want to make our local APT tools aware of Docker's in-house repositories.

14. Fetch the GPG key from Docker, to ensure authenticity of our downloads.

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

15. Add the Docker repository to our APT tools.

```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

16. Now would be a fine time to update our database of APT packages.

```sh
sudo apt-get update
```

Run the following command to verify that our Docker downloads will come from Docker.

```sh
apt-cache policy docker-ce
```

17. Install Docker.

```sh
sudo apt-get install -y docker-ce
```

After this completes, wait a minute or so, then enter the following command to ensure Docker is up and running.

```sh
sudo systemctl status docker
```

(If needed, hit Ctrl-C to exit.)

To really test Docker, go ahead and run the *hello-world* container.

```sh
sudo docker run hello-world
```

18. Did you want to type `sudo` every time you use Docker? Me neither. Let's fix that. Add our *openopps* user account to the *docker* group.

```sh
sudo usermod -aG docker ${USER}
```

You will get some weird messages that suggest you may have broken something...

```sh
sent invalidate(passwd) request, exiting
sent invalidate(group) request, exiting
sent invalidate(passwd) request, exiting
sent invalidate(group) request, exiting
```

...but you're okay, this is safe to ignore.

19. Apply the new group assignment.

```sh
su - ${USER}
```

Docker should now work without using `sudo`.

```sh
docker run hello-world
```

#### Install Docker Compose

Like with Docker, we're going to cheat a bit and avoid the official APT repositories, to get a more up-to-date version.

20. Check for the current [version number](https://github.com/docker/compose/releases). As of this writing, the current version is *1.21.2*.
21. Install Docker Compose. Edit the version number in the middle of the command's URL as needed.

```sh
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

22. We need to tell Ubuntu that this new installation is an executable file.

```sh
sudo chmod +x /usr/local/bin/docker-compose
```

Verify that it works.

```sh
docker-compose --version
```

#### Install Node.js

Next up, Node.js installation. As with Docker, we're going to download this directly from Node rather than APT.

23. Download Node.js.

```sh
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
```

24. Install Node.js.

```sh
sudo apt-get install -y nodejs
```

25. Update Node's package management tool, *npm*.

```sh
sudo npm i -g npm
```

26. Let's go ahead and install build tools too, just in case npm needs it.

```sh
sudo apt-get install -y build-essential
```

### Install Open Opportunities

Finally, we get to install Open Opportunities onto our VM.

27. Switch to the directory for the openopps user account.

```sh
cd /home/openopps/
```

28. Download the Open Opps code from our GitHub fork.

```sh
git clone https://github.com/xjensen/openopps-platform.git
```

29. Switch into the directory for the Open Opps code.

```sh
cd /home/openopps/openopps-platform
```

30. Switch to the *docker-azure* branch of the codebase.

```sh
git checkout docker-azure
```

31. Install the application's local Node.js dependencies.

```sh
sudo npm install
```

31. Use Docker Compose to build the Open Opps application.

```sh
npm run docker:build
```

Sit back and relax as Docker builds the app's entire environment from scratch.

Wait up, why are we using *npm* to run *Docker Compose*? The answer can be found in the following file, where a number of convenient scripts have been defined for use with the *npm run* command.

https://github.com/xjensen/openopps-platform/blob/docker-azure/package.json

32. Run Open Opps.

```sh
npm run docker:azure
```

### Cleaning up

33. Go back to the Azure Portal.

34. Select the VM we created all the way back at the beginning.

35. Select *Networking*.

36. Add an *Inbound Port Rule*. Change the destination port to *80* and the protocol to *TCP*. *Add* it.
