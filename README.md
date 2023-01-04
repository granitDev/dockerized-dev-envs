# Dockerized Development Environments

Containerized development environments for use with VSCode utilizing Docker

## Setup

### Docker

In order to use these environments, you must have Docker installed on your system:
>`sudo apt install docker.io`

>`sudo apt install docker-compose`

Add your user to the docker group:
>`sudo usermod -aG docker <username>`

### VSCode

Install the [Dev Containers](ms-vscode-remote.remote-containers) extension for VSCode

### Host Environment

Each containerized environment has it's own environment variable that it uses to create a shared directory in order to access your code without storing the code in the container. That ensure that you can always create a new fresh environment if you break something without ever risking losing data. You need to set that environment variable to the path to your repo's source code.

For each containerized environment, if you open the `docker-compose.yml` file, under "volumes:" you will see the name of the environment variable you need to create inside the `${...}` as it's different for each container, allowing you to have as many different ones as you like. By default it assumes a subdirectory of `src` but you can easily clone this repo and modify that if need be to match your repo setup.

# Usage

## Creating A Containerized Environment

For any individual environment you can either run commands manually as listed in the script, or you can set the execute permission on the script and just run it.

>Run `sudo chmod +x create_fresh_environment.sh`

Each script has the same name, but is customized for the names of the respective images and containers for the environment it's with.

## Using the Container With VSCode

Start your container

>`docker start <container_name>`

In VSCode, press `CTRL+SHIFT+P` and run "Dev Containers: Atache to Running Container..." and select your container form the list.

This will open a new VSCode window in which you will need to select the `/repo/src` directory in order to access your code from inside the repo.
