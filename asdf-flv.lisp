;;; asdf-flv.lisp --- Implementation

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

(in-package :com.dvlsoft.asdf-flv)


(defvar *file-local-variables* ()
  "List of file-local special variables.")

(defun make-variable-file-local (symbol)
  "Make special variable named by SYMBOL have a file-local value."
  (pushnew symbol *file-local-variables*))

(defmethod asdf:perform :around
    ((operation asdf:load-op) (file asdf:cl-source-file))
  "Establish new dynamic bindings for file-local variables."
  (progv *file-local-variables*
      (mapcar #'symbol-value *file-local-variables*)
    (call-next-method)))

(defmethod asdf:perform :around
    ((operation asdf:compile-op) (file asdf:cl-source-file))
  "Establish new dynamic bindings for file-local variables."
  (progv *file-local-variables*
      (mapcar #'symbol-value *file-local-variables*)
    (call-next-method)))


;;; asdf-flv.lisp ends here
