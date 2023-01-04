# Dockerized Development Environments

Containerized development environments for use with VSCode utilizing Docker

## Setup

In order to use these environments, you must have Docker installed on your system:
>`sudo apt install docker.io`
>`sudo apt install docker-compose`

Add your user to the docker group:
>`sudo usermod -aG docker <username>`

# Usage

For any individual environment you can either run commands manually as listed in the script, or you can set the execute permission on the script and just run it.

>Run `sudo chmod +x create_fresh_environment.sh`

Each script has the same name, but is customized for the names of the respective images and containers for the environment it's with.

