ASDF-FLV provides support for file-local variables through ASDF. A file-local
variable behaves like `*PACKAGE*` and `*READTABLE*` with respect to LOAD and
COMPILE-FILE: a new dynamic binding is created before processing the file, so
that any modification to the variable essentially becomes file-local.

In order to make a variable file-local, use the function
MAKE-VARIABLE-FILE-LOCAL.
