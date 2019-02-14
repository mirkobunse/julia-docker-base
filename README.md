[![Build Status](https://travis-ci.com/mirkobunse/julia-docker-base.svg?branch=master)](https://travis-ci.com/mirkobunse/julia-docker-base)

# julia-docker-base

This base image eases the deployment of Julia applications in Docker.
Inheriting from julia-docker-base will trigger so-called `ONBUILD` steps
which for example resolve dependencies provided by a REQUIRE-file.

## Usage

Simply specify `bunse/julia-docker-base` as your base image, using the `FROM` statement
in your Dockerfile. Your project directory should contain a folder `julia-docker-base`
which contains three files to be used in the `ONBUILD` steps.

      your-project/
      ├── Dockerfile
      └── julia-docker-base/
          ├── prepare.sh
          ├── REQUIRE
          └── setup.jl

- `Dockerfile` is just like any other Dockerfile
- `prepare.sh` performs whatever is needed before the Julia packages are installed.
  For example, you may have to install some debian packages with `apt-get` on which
  your Julia packages depend.
- `REQUIRE` specifies all Julia package dependencies, optionally with version ranges.
  A tutorial on how to make requirements specifications is given in the
  [official Julia manual](https://docs.julialang.org/en/v0.6/manual/packages/#Requirements-Specification-1).
- `setup.jl` performs any additional steps, like cloning un-registered packages.

You can omit any of the files in your julia-docker-base directory.
Take a look at the `example` directory of this repository to see how it works.

      make example

## Custom Builds

This image contains `*-custom` tags which do not define any `ONBUILD` steps.
These tags are meant for user who wish for more control over their build process.
If you use a `*-custom` tag, you can perform the following steps in your
Dockerfile to achieve the default behaviour:

      ADD julia-docker-base /opt/julia-docker-base/
      RUN /bin/bash /opt/julia-docker-base/prepare.sh
      RUN julia --optimize=3 /opt/julia-docker-base/resolve.jl
      RUN julia --optimize=3 /opt/julia-docker-base/precompile.jl
      RUN julia --optimize=3 /opt/julia-docker-base/setup.jl
