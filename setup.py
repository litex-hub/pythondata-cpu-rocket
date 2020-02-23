import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

from litex.data.cpu.rocket import version_str

setuptools.setup(
    name="litex-data-cpu-rocket",
    version=version_str,
    author="LiteX Authors",
    author_email="litex@googlegroups.com",
    description="Python module containing data files for using the Rocket cpu with LiteX.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/litex-hub/litex-data-cpu-rocket",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.5',
    zip_safe=False,
    packages=setuptools.find_packages(),
    package_data={'litex.data.cpu.rocket': ['litex/data/cpu/rocket/verilog/**']},
    include_package_data=True,
)