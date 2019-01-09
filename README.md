# pycparser-fake-libc

Simple build wrapper to create a pip-installable package which includes all of the headers from [pycparser](https://github.com/eliben/pycparser)/utils/fake_libc_include.

See: https://github.com/eliben/pycparser

To build, run `make` to copy the headers from the submoduled `pycparser` into the library dir and build the wheel file

Usage:

```python
import os
import pycparser_fake_libc
import pycparser

fake_libc_arg = "-I" + pycparser_fake_libc.directory

ast = pycparser.parse_file("c_file_to_parse.c", use_cpp=True, cpp_args=fake_libc_arg)
```
