### Getting started

```bash
cd docker/ && docker-compose up --build
```

To access directly from local host the PostgreSQL database container

```bash
psql postgresql://postgres:password@127.0.0.1:15432/dbtest
```

Read this post on dev.to for more: https://dev.to/nicolasbonnici/how-to-build-a-clean-docker-symfony-5-2-php8-postegresql-nginx-project-3l5g

Enter container bash to do things like install s.th. by composer or hack symfony commands...

-it: tell Docker to open an interactive shell in the specified container with a TTY allocated and the standard input kept open. 
This allows you to directly interact with the container's command line, just like if you were using a terminal on your local machine.

    -i: This flag allows you to interact with the container by keeping STDIN open. It keeps the container's STDIN open even if not attached. This is usually used with the -t option to allocate a pseudo-TTY.

    -t: Allocates a pseudo-TTY, which gives you an interactive shell in the container.
    
```bash
docker exec -it php-fpm /bin/bash 
```
