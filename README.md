# pythondata-cpu-rocket

Non-Python  files needed for the cpu rocket packaged
into a Python module so they can be used with Python libraries and tools.

This is useful for usage with tools like
[LiteX](https://github.com/enjoy-digital/litex.git).

The data files can be found under the Python module `pythondata_cpu_rocket`. The
`pythondata_cpu_rocket.data_location` value can be used to find the files on the file
system.

Example of getting the data file directly;
```python
import pythondata_cpu_rocket

my_data_file = "abc.txt"

with open(os.path.join(pythondata_cpu_rocket.data_location, my_data_file)) as f:
    print(f.read())
```

Example of getting the data file using `litex.data.find` API;
```python
from pythondata_cpu_rocket import data_file

my_data_file = "abc.txt"

with open(data_file(my_data_file)) as f:
    print(f.read())
```



The data files are generated from https://github.com/chipsalliance/rocket-chip.git and place in the directory
[pythondata_cpu_rocket/verilog](pythondata_cpu_rocket/verilog).


## Installing from git repository

## Manually

You can install the package manually, however this is **not** recommended.

```
git clone https://github.com/litex-hub/pythondata-cpu-rocket.git
cd pythondata-cpu-rocket
sudo python setup.py install
```

## Using [pip](https://pip.pypa.io/) with git repository

You can use [pip](https://pip.pypa.io/) to install the data package directly
from github using;

```
pip install --user git+https://github.com/litex-hub/pythondata-cpu-rocket.git
```

If you want to install for the whole system rather than just the current user,
you need to remove the `--user` argument and run as sudo like so;

```
sudo pip install git+https://github.com/litex-hub/pythondata-cpu-rocket.git
```

You can install a specific revision of the repository using;
```
pip install --user git+https://github.com/litex-hub/pythondata-cpu-rocket.git@<tag>
pip install --user git+https://github.com/litex-hub/pythondata-cpu-rocket.git@<branch>
pip install --user git+https://github.com/litex-hub/pythondata-cpu-rocket.git@<hash>
```

### With `requirements.txt` file

Add to your Python `requirements.txt` file using;
```
-e git+https://github.com/litex-hub/pythondata-cpu-rocket.git
```

To use a specific revision of the repository, use the following;
```
-e https://github.com/litex-hub/pythondata-cpu-rocket.git@<hash>
```

## Installing from [PyPi](https://pypi.org/project/pythondata-cpu-rocket/)

## Using [pip](https://pip.pypa.io/)

```
pip install --user pythondata-cpu-rocket
```
