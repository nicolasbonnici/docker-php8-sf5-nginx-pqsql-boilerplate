### Getting started

```bash
cd docker/ && docker-compose up --build
```

To access directly from local host the PostgreSQL database container

```bash
psql postgresql://postgres:password@127.0.0.1:15432/dbtest
```

Read this post on dev.to for more: https://dev.to/nicolasbonnici/how-to-build-a-clean-docker-symfony-5-2-php8-postegresql-nginx-project-3l5g
