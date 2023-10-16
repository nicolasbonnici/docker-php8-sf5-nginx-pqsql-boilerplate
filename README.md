### Getting started

Please add SSH_KEY_NAME to `docker/.env` and enter your key file name

```
SSH_KEY_NAME=id_my_key_file_name
```

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

    -t: Allocates a pseudo-TTY, which gives you an interactive shell in the php-fpm container.

```bash
docker exec -it php-fpm /bin/bash 
```

You could start a project by this command inside the php-fpm conatiner. 

```bash
composer create-project symfony/skeleton .
```

Or checkout a repository, make sure bootstrap lies direktly in /var/www insid the php-fpm container.
To do this, perhaps it could be an idea to `git clone ` the repo on your local machine outside of the container, jump in the container and rund composer i.

Assuming you followed me in the container by `docker exec -it ...`, you exit to your operating system/ wsl:
```bash
exit
git clone {your-git-repository} . 
docker exec -it php-fpm /bin/bash 
composer i
```

If you have a project running below /project folder, consider never to use `CMD composer i -o ...` commands in your Dockerfile, could be doing something you do not want. Inside your /project folder a repo w/o docker could be hosted, can be anything needing php. Symfony is just an example. 

