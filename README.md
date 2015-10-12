ASDF-FLV provides support for file-local variables through ASDF. A file-local
variable behaves like *PACKAGE* and *READTABLE* with respect to LOAD and
COMPILE-FILE: a new binding is created before processing the file, so that any
modification to the variable becomes essentially file-local.

In order to make a variable file-local, use the function
MAKE-VARIABLE-FILE-LOCAL.
