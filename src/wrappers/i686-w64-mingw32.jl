# Autogenerated wrapper script for x265_jll for i686-w64-mingw32
export libx265, x265

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libx265`
const libx265_splitpath = ["bin", "libx265.dll"]
const libx265_joinpath = joinpath(libx265_splitpath...)

# This will be filled out by __init__() for all products, as it must be done at runtime
libx265_path = ""

# libx265-specific global declaration
# This will be filled out by __init__()
libx265_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libx265 = "libx265.dll"


# Relative path to `x265`
const x265_splitpath = ["bin", "x265.exe"]
const x265_joinpath = joinpath(x265_splitpath...)

# This will be filled out by __init__() for all products, as it must be done at runtime
x265_path = ""

# x265-specific global declaration
x265(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true) =
    executable_wrapper(f, x265_path, PATH, LIBPATH, LIBPATH_env, LIBPATH_default, adjust_PATH, adjust_LIBPATH, ':')


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    global libx265_path, libx265_handle
    libx265_path, libx265_handle = get_lib_path_handle!(LIBPATH_list, artifact_dir, libx265_joinpath, RTLD_LAZY | RTLD_DEEPBIND)

    global x265_path = get_exe_path!(PATH_list, artifact_dir, x265_joinpath)

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    global PATH, LIBPATH
    PATH, LIBPATH = cleanup_path_libpath!(PATH_list, LIBPATH_list, ';')
 
end  # __init__()
