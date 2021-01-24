# OpenMage DDE-Starter-Project

Setup based on https://github.com/sandstein/docker-dev-environment

...

##  Installation

It is recommended to install DDE and all your projects to `~/workspace`

- `mkdir ~/workplace`

### Install DDE

- `cd ~/workspace`
- `git clone git@github.com:sandstein/docker-dev-environment.git docker/dev-environment`
- `cd ~/workspace/docker/dev-environment`
- `ln -s ../.. vhosts`

### Install Sample

- `cd ~/workspace`
- `git git@github.com:OpenMageDev/dde-starter-project.git tests/sample`
- `cd ~/workspace/tests/sample`

#### Customize setup

Setup containers (php-version, db-version, additionals like redis or mailhog)
- `cp docker/.env.sample .env`

Setup virtual host
- `cp docker/config/sample.conf ~/workspace/docker/dev-environment/config/apache24/conf.d/`

Start sample installation (should start apache and all other containers)

- `dde-start`

_(docker containers should be built or started)_

Install composer inside docker container

- `dde-cli bash`
- run `wget` to install composer to `~/bin`

Initial setup (create DB, run custom scripts, import media files ...)
- `dde-cli docker/init-dev-environment.sh`

_(DB shema should be created, and OpenMage should be installed to htdocs)_

If everything worked `http//:sample.localhost` should show up OpenMage installation page.

To automatically install OM you can run scripts from `init-dev-environment.sh`.
