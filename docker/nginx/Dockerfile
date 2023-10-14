# This Dockerfile sets up an Nginx web server using the Alpine Linux-based image.
#  When a container is started from this image, it will automatically start Nginx. 
# 
# Sets the base image for this Dockerfile. It means that this image is based on the official Nginx image from Docker Hub, 
#  using the Alpine Linux distribution as its base.
FROM nginx:alpine
# Sets the working directory inside the image to /var/www. This is where the subsequent commands will be executed.
WORKDIR /var/www
# Defines the default command to run when a container is started. In this case, it starts the Nginx web server.
CMD ["nginx"]
# This informs Docker that the container will listen on ports 80 and 443 at runtime. 
#  It doesn't actually map the ports to the host, but it's a kind of documentation for someone who might want to run this container.
EXPOSE 80 443
