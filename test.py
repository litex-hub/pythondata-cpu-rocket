#!/usr/bin/env python3
import os

from litex.data.cpu import rocket

print("Found rocket @ version", rocket.version_str, "("+rocket.git_hash+")")
print("Data is in", rocket.data_location)
assert os.path.exists(rocket.data_location)
print("It contains:\n -", end=" ")
print("\n - ".join(os.listdir(rocket.data_location)))
