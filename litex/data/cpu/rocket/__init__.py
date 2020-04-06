import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "verilog")
src = "https://github.com/chipsalliance/rocket-chip.git"

# Module version
version_str = "0.0.post7050"
version_tuple = (0, 0, 7050)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post7050")
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
tool_version_str = "0.0.post46"
tool_version_tuple = (0, 0, 46)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post46")
except ImportError:
    pass
