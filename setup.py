from setuptools import setup, find_packages
import sys

# Version should patch the pycparser submodule version
VERSION = "v2.21"

with open("README.md", "r") as f:
    long_description = f.read().replace("\r", "")

setup(
    name="pycparser-fake-libc",
    version=VERSION.lstrip("v"),  # Remove the leading v, pip doesn't like that
    description="Pip-installable package with pycparser's fake libc headers",
    long_description_content_type="text/markdown",
    long_description=long_description,
    url="https://github.com/ThomasGerstenberg/pycparser-fake-libc",
    author="Thomas Gerstenberg",
    author_email="tgerst6@gmail.com",
    keywords="pycparser",
    packages=find_packages(exclude=["test", "test.*"]),
    include_package_data=True,
)
