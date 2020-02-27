import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "verilog")
src = "https://github.com/chipsalliance/rocket-chip.git"
git_hash = "1cf70ea2"
git_describe = "v0.0-7004-g1cf70ea2"
version_str = "0.0.post7004"
version_tuple = (0, 0)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post7004")
except ImportError:
    pass
