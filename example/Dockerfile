FROM bunse/julia-docker-base:0.6.4

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

# create a user from the build-time variables
RUN groupadd --gid $gid $group && \
    useradd  --gid $gid --uid $uid -d /home/$user $user

# make our julia installation belong to $user
RUN ln -s /root /home/$user && \
    chown --recursive $uid:$gid \
      /home/$user \
      /root

# also, I am always annoyed by 'll' not being recognized
RUN echo "alias ll='ls -halF'" >> /home/$user/.bashrc

USER $uid
WORKDIR /home/$user/
