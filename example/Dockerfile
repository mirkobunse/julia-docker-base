FROM bunse/julia-docker-base:latest

MAINTAINER Mirko Bunse <mirko.bunse@cs.tu-dortmund.de>

# 
# REQUIRE and setup.jl are automatically added when inheriting from bunse/julia-docker-base
# 
# Here, you can add whatever you like. As an example, we will set the stage for a non-root user.
# 

# These are build-time variables to be set, e.g. by a Makefile
ARG group
ARG gid
ARG user
ARG uid

# create $user and make our Julia installation accessible
RUN groupadd --gid $gid $group && \
    useradd  --gid $gid --uid $uid --create-home $user && \
    chown --recursive $uid:$gid $JULIA_PKGDIR

# also, I am always annoyed by 'll' not being recognized
RUN echo "alias ll='ls -halF'" >> /home/$user/.bashrc

USER $uid
WORKDIR /home/$user/
