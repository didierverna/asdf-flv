;;; com.dvlsoft.asdf-flv.asd --- ASDF system definition

;; Copyright (C) 2011 Didier Verna

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>

;; This file is part of ASDF-FLV.

;; Permission to use, copy, modify, and distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THIS SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


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
    :license "BSD"
    :version "1.0"
    :serial t
    :components ((:file "package")
		 (:file "asdf-flv")))


;;; com.dvlsoft.asdf-flv.asd ends here
