import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "verilog")
src = "https://github.com/enjoy-digital/rocket-litex-verilog"
git_hash = "fb31001d9655ebfb8ab25209e094939f68feb6a7"
git_describe = "v0.0-12-gfb31001"
version_str = "0.0.post12"
version_tuple = (0, 0)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post12")
except ImportError:
    pass