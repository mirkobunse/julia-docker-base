FROM julia:0.6.4

MAINTAINER Mirko Bunse <mirko.bunse@cs.tu-dortmund.de>

# copy setup to /opt/julia-docker-base and initialize the package depot
ADD julia-docker-base/ /opt/julia-docker-base/
RUN julia -e 'Pkg.init()'

# configure builds which use this image as a base image
ONBUILD ADD REQUIRE setup.jl   /opt/julia-docker-base/
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/resolve.jl
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/precompile.jl
ONBUILD RUN julia --optimize=3 /opt/julia-docker-base/setup.jl

# configure entry point
ENTRYPOINT ["/opt/julia-docker-base/entrypoint.sh"]
CMD ["bash"]
