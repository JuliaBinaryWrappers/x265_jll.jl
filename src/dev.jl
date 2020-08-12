using Pkg, Pkg.Artifacts
# First, `dev` out the package, but don't effect the current project
mktempdir() do temp_env
    Pkg.activate(temp_env) do
        Pkg.develop("x265_jll")
    end
end
# Create the override directory
override_dir = joinpath(Pkg.devdir(), "x265_jll", "override")
# Copy the current artifact contents into that directory
if !isdir(override_dir)
    cp(artifact"x265", override_dir)
end
# Force recompilation of that package, just in case it wasn't dev'ed before
touch(joinpath(Pkg.devdir(), "x265_jll", "src", "x265_jll.jl"))
@info("x265_ll dev'ed out to /home/sabae/.julia/dev/x265_jll with pre-populated override directory")
