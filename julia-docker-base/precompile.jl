# precompile registered packages
for p in Pkg.available()
  try
    @eval using $(Symbol(p)) # trigger pre-compilation
    println(p)
  end
end
