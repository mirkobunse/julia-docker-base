# check custom REQUIRE file
path = "/opt/julia-docker-base/REQUIRE"
if filesize(path) == 0
  println("WARNING: julia-docker-base/REQUIRE.jl does not exist or is empty")
end

# install registered packages
run(`rm $(Pkg.dir("REQUIRE"))`)          # remove empty REQUIRE file
run(`ln -s $path $(Pkg.dir("REQUIRE"))`) # link the right one
Pkg.resolve() # resolve dependencies from the REQUIRE file
