;;; com.dvlsoft.asdf-flv.asd --- ASDF system definition

;; Copyright (C) 2011 Didier Verna

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>

;; This file is part of ASDF-FLV.

;; Copying and distribution of this file, with or without modification,
;; are permitted in any medium without royalty provided the copyright
;; notice and this notice are preserved.


;;; Commentary:

;; Contents management by FCM version 0.1.


;;; Code:

(in-package :cl-user)

(asdf:defsystem :com.dvlsoft.asdf-flv
    :description "ASDF support for file-local variables."
    :long-description
    "ASDF-FLV provides support for file-local variables through ASDF.

A file-local variable behaves like *PACKAGE* and *READTABLE* with respect to
LOAD and COMPILE-FILE: a new binding is created before processing the file, so
that any modification to the variable becomes essentially file-local.

In order to make a variable file-local, use MAKE-VARIABLE-FILE-LOCAL."
    :author "Didier Verna <didier@lrde.epita.fr>"
    :maintainer "Didier Verna <didier@lrde.epita.fr>"
    :license "GNU All Permissive"
    :version "1.0"
    :serial t
    :components ((:file "package")
		 (:file "asdf-flv")))


;;; com.dvlsoft.asdf-flv.asd ends here
