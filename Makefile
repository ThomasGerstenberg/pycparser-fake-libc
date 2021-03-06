# Suspend command echo for non-verbose builds
ifeq ("$(VERBOSE)","1")
NO_ECHO :=
else
NO_ECHO := @
endif


# Utility commands
RM     := $(NO_ECHO)rm -rf
CD     := $(NO_ECHO)cd
CP     := $(NO_ECHO)cp
TOUCH  := $(NO_ECHO)touch
PYTHON := $(NO_ECHO)python3
PIP    := $(PYTHON) -m pip


PYCPARSER_ROOT := $(abspath .)/pycparser
PYCPARSER_FAKE_HEADERS_DIR := $(PYCPARSER_ROOT)/utils/fake_libc_include

PACKAGE_ROOT := $(abspath .)/pycparser_fake_libc

.PHONY: all clean copy_headers packages

all: packages

clean:
	$(RM) $(PACKAGE_ROOT)/*.[ch]
	$(RM) ./dist
	$(RM) ./build
	$(RM) ./*.egg-info

copy_headers:
	$(CP) -r $(PYCPARSER_FAKE_HEADERS_DIR)/* $(PACKAGE_ROOT)

packages: copy_headers
	$(PYTHON) setup.py sdist bdist_wheel