ASDF-FLV provides support for file-local variables through ASDF. A file-local
variable behaves like `*PACKAGE*` and `*READTABLE*` with respect to `LOAD` and
`COMPILE-FILE`: a new dynamic binding is created before processing the file,
so that any modification to the variable essentially becomes file-local.

In order to make one or several variables file-local, use the macros
`SET-FILE-LOCAL-VARIABLE(S)`.

For portability with the Genera system, the
[GitHub](https://github.com/didierverna/asdf-flv) repository has a
<kbd>genera</kbd>
[branch](https://github.com/didierverna/asdf-flv/tree/genera) (thanks to Steve
Nunez).
