# This Dockerfile is used to create an image that sets up a PHP 8.1 environment with various extensions and tools. 
#  When a container is started from this image, it will install dependencies, wait for a database, apply migrations, and then start the PHP-FPM process.
# 
# Sets the base image for this Dockerfile. It means that this image is based on the official PHP 8.1-fpm image from Docker Hub.
FROM php:8.1-fpm
# Copies a file named wait-for-it.sh from the local file system (the directory where the Dockerfile is located) 
#  to the /usr/bin/wait-for-it directory inside the image.
COPY wait-for-it.sh /usr/bin/wait-for-it
# RMakes the wait-for-it file executable. It changes the file permissions to allow execution.
RUN chmod +x /usr/bin/wait-for-it

# RUN: A series of commands that are executed inside the image.
# apt-get update: Updates the package lists for upgrades and new package installations.
RUN apt-get update
# Installs a series of packages, including libraries and tools.
RUN apt-get install -y --no-install-recommends \
    libssl-dev \
    zlib1g-dev \
    curl \
    git \
    unzip \
    netcat-traditional \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    librabbitmq-dev \
    libxslt1-dev
# Installs the APCu extension for PHP.
RUN pecl install \
    apcu \
    amqp \
    redis
# Configures PHP extensions for PostgreSQL (pgsql).
RUN docker-php-ext-configure \
    pgsql -with-pgsql=/usr/local/pgsql
# Installs PHP extensions.
RUN docker-php-ext-install \
    -j$(nproc) \
    zip \
    opcache \
    intl \
    pdo_pgsql \
    pgsql \
    xsl
# Enables PHP extensions.
RUN docker-php-ext-enable \
    apcu \
    pdo_pgsql \
    sodium \
    amqp
# Cleans up the package cache and temporary files to reduce the image size.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    # Possible values for ext-name:
    #  bcmath bz2 calendar ctype curl dba dl_test dom enchant exif ffi fileinfo filter ftp gd gettext 
    #  gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql
    #  pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml 
    #  snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlwriter xsl zend_test zip

# Copies the composer binary from another image layer. This assumes that a previous stage in the build process has a composer binary available.
COPY --from=composer /usr/bin/composer /usr/bin/composer
# Sets the working directory inside the image to /var/www. This is where the subsequent commands will be executed.
WORKDIR /var/www
# Defines the default command to run when a container is started.
    # composer i -o: Installs dependencies using Composer.
    # wait-for-it db:5432 -- bin/console doctrine:migrations:migrate: Waits for a PostgreSQL database to become available on port 5432, 
    #  and then runs a Doctrine migration.
    # php-fpm: Starts the PHP FastCGI Process Manage
# CMD composer i -o ; wait-for-it db:5432 -- bin/console doctrine:migrations:migrate ;  php-fpm 
# Just starting PHP FastCGI Process Manage, and let packages be as it is. 
CMD php-fpm 
# Informs Docker that the container will listen on port 9000 at runtime. It doesn't actually map the port to the host, 
#  but it's a kind of documentation for someone who might want to run this container.
EXPOSE 9000
