FROM bunse/julia-docker-base:custom-0.6.4

MAINTAINER Mirko Bunse <mirko.bunse@cs.tu-dortmund.de>

# configure builds which use this image as a base image
ONBUILD ADD julia-docker-base /opt/julia-docker-base/
ONBUILD RUN /bin/bash /opt/julia-docker-base/prepare.sh
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/resolve.jl
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/precompile.jl
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/setup.jl
