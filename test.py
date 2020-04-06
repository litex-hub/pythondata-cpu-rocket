#!/usr/bin/env python3
import os

from litex.data.cpu import rocket

print("Found rocket @ version", rocket.version_str, "(with data", rocket.data_version_str, ")")
print()
print("Data is in", rocket.data_location)
assert os.path.exists(rocket.data_location)
print("Data is version", rocket.data_version_str, rocket.data_git_hash)
print("-"*75)
print(rocket.data_git_msg)
print("-"*75)
print()
print("It contains:")
for root, dirs, files in os.walk(rocket.data_location):
    dirs.sort()
    for f in sorted(files):
        path = os.path.relpath(os.path.join(root, f), rocket.data_location)
        print(" -", path)
