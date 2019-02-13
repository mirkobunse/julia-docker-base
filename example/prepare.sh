# This file is executed before Julia packages are resolved from the REQUIRE file.
# Thus, you can use it to install dependencies and utilities.
apt-get update && \
  apt-get install -y less && \
  apt-get clean
