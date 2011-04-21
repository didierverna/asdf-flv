;;; asdf-flv.lisp --- Implementation

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
