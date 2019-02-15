# check custom REQUIRE file
path = "/opt/julia-docker-base/REQUIRE"
if filesize(path) == 0
  println("WARNING: julia-docker-base/REQUIRE.jl does not exist or is empty")
end

# install registered packages
run(`rm $(Pkg.dir("REQUIRE"))`)       # remove empty REQUIRE file
run(`mv $path $(Pkg.dir("REQUIRE"))`) # bring the right one in place
Pkg.resolve() # resolve dependencies from the REQUIRE file
