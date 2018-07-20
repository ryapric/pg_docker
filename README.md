Dockerization Template for PostgreSQL Deployment via Docker Compose
===================================================================

This Docker Compose YAML file (`docker-compose.yml`) allows for the deployment of two [Docker](https://www.docker.com/) containers: a [PostgreSQL](https://www.postgresql.org/) database instance, and a [pgAdmin](https://www.pgadmin.org/) instance for managing it. By design, Docker Compose files are easily extensible, and so this can be used as a template for your own project.

Prerequisites
-------------

1. Docker
    - Installation on Linux is straightforward:

    ```sh
    $ curl -fsSL https://get.docker.com -o docker-install.sh
    $ # Inspect the file for malicious code, then:
    $ sh docker-install.sh
    ```

1. Docker Compose ([less-straightforward installation](https://docs.docker.com/compose/install/))

How to use
----------

You can deploy the containers via `docker-compose up`:

```sh
$ git clone https://github.com/ryapric/pg_docker.git
$ cd pg_docker
$ docker-compose up
```

The actual database instance will be broadcasting on Postgres' default port `5432`, and pgAdmin will be available in your browser at `localhost:5050`. pgAdmin login defaults to:

    email:    test@gmail.com
    password: postgres

The Postgres instance itself requires a `psql` login of:

    user:     postgres
    password: postgres

If modifying for your own project, or if you just want those credentials changed, you can edit their respective `environment` fields in `docker-compose.yml`.

At launch, two Docker volumes are mounted: one to the `pg` container (the actual database) for persistent database storage, and one to the `pgadmin` container to save pgAdmin settings across sessions. As such, you will need to create a connection to the Postgres server *manually* through pgAdmin, but only once. You can do this by specifying the _**hostname as "db"**_ when creating the server connection through pgAdmin's interface. This is how `docker-compose` is set to handle name resolution, in this file's case.

If you want to thoroughly clean up when you're done using the services, just run:

```sh
$ docker-compose down
```

which will remove the containers, and the network they created for themselves. But be careful: `docker-compose down` has options that can _**also delete the volumes**_ declared in the `docker-compose.yml` file!
