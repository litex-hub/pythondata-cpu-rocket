import setuptools
import re

with open("README.md", "r") as fh:
    long_description = fh.read()

with open("pythondata_cpu_rocket/__init__.py", "r") as fh:
    version_str = re.search(
        r'^version_str = "([^"]+)"',
        fh.read(),
        re.MULTILINE,
    ).group(1)

setuptools.setup(
    name="pythondata-cpu-rocket",
    version=version_str,
    author="LiteX Authors",
    author_email="litex@googlegroups.com",
    description="""\
Python module containing verilog files for Rocket cpu.""",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/litex-hub/pythondata-cpu-rocket",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.5',
    zip_safe=False,
    packages=setuptools.find_packages(),
    package_data={
    	'pythondata_cpu_rocket': ['verilog/**'],
    },
    include_package_data=True,
    project_urls={
        "Bug Tracker": "https://github.com/litex-hub/pythondata-cpu-rocket/issues",
        "Source Code": "https://github.com/litex-hub/pythondata-cpu-rocket",
    },
)
