# 📨 Baggy: a container for [Postal](https://github.com/atech/postal/)

:fr: Baggy est un outil d'orchestration de [Postal](https://github.com/atech/postal/) dans des conteneurs Docker. Le but de Baggy est de permettre de déployer facilement une solution d'envoi d'emails transactionnels.

:gb: Baggy is an orchestration solution for [Postal](https://github.com/atech/postal/) in Docker containers. The goal of Baggy is to make it easy to deploy a transactional emailing solution.

**Baggy is currently in testing and is not production-ready.**

           _       _           
      __ _| |_ __ | |__   __ _ 
     / _` | | '_ \| '_ \ / _` |
    | (_| | | |_) | | | | (_| |
     \__,_|_| .__/|_| |_|\__,_|
            |_|

# Installation

Copy the sample configuration:

    cp .env.sample .env

Edit the `.env` file and set appropriate values there. To generate random strings, such as the postal secret key or the various passwords, you can run:

    make randomstring

Then, run:

    make build
    make init
    make user
    make start

There should be a web UI accessible at http://localhost. To daemonize, run instead:

    make start-daemon

For more information, check out the [Postal documentation](https://github.com/atech/postal/wiki).

The `send.py` script can be run to test that the server is working properly.

# License

Baggy is licensed under the GNU Affero Public License (AGPL) v3. Some of the code in Baggy was borrowed from [docker-postal](https://github.com/CatDeployed/docker-postal/), which does not have an explicit license.
