# install registered packages
run(`rm $(Pkg.dir("REQUIRE"))`) # remove empty REQUIRE file
run(`ln -s /opt/julia-docker-base/REQUIRE $(Pkg.dir("REQUIRE"))`) # add the right one
Pkg.resolve() # resolve dependencies from the REQUIRE file
