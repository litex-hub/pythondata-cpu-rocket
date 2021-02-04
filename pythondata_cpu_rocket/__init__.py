import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "verilog")
src = "https://github.com/chipsalliance/rocket-chip.git"

# Module version
version_str = "0.0.post7076"
version_tuple = (0, 0, 7076)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post7076")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post7004"
data_version_tuple = (0, 0)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post7004")
except ImportError:
    pass
data_git_hash = "1cf70ea2"
data_git_describe = "v0.0-7004-g1cf70ea2"
data_git_msg = """\

"""

# Tool version info
tool_version_str = "0.0.post72"
tool_version_tuple = (0, 0, 72)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post72")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_rocket."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_rocket".format(f))
    return fn
