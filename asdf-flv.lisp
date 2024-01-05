;;; asdf-flv.lisp --- Implementation

;; Copyright (C) 2011, 2015 Didier Verna

;; Author: Didier Verna <didier@didierverna.net>

;; This file is part of ASDF-FLV.

;; Copying and distribution of this file, with or without modification,
;; are permitted in any medium without royalty provided the copyright
;; notice and this notice are preserved.  This file is offered as-is,
;; without any warranty.


;;; Commentary:

;; Contents management by FCM version 0.1.


;;; Code:

(in-package :net.didierverna.asdf-flv)


(defvar *file-local-variables* ()
  "List of file-local special variables.")


(eval-when (:load-toplevel :compile-toplevel :execute)
  (unless (find-class 'asdf-flv-mixin nil)
    (defclass asdf-flv-mixin ()
      ()))
  (unless (subtypep 'asdf:cl-source-file 'asdf-flv-mixin)
    (let ((original-class (find-class 'asdf:cl-source-file)))
      (setf (find-class 'original-asdf-cl-source-file)
            original-class
            (find-class 'asdf:cl-source-file)
            nil))
    (#+allegro excl:without-redefinition-warnings
     #+sbcl locally
     #+sbcl (declare (sb-ext:muffle-conditions sb-kernel:redefinition-warning))
     #-(or allegro sbcl) progn
     (defclass asdf:cl-source-file (asdf-flv-mixin original-asdf-cl-source-file)
       ()))))


(defun make-variable-file-local (symbol)
  "Make special variable named by SYMBOL have a file-local value."
  (pushnew symbol *file-local-variables*))

(defmacro set-file-local-variable (symbol)
  "Set special variable named by SYMBOL as file-local.
SYMBOL need not be quoted."
  `(make-variable-file-local ',symbol))

(defun make-variables-file-local (&rest symbols)
  "Make special variables named by SYMBOLS have a file-local value."
  (dolist (symbol symbols)
    (pushnew symbol *file-local-variables*)))

(defmacro set-file-local-variables (&rest symbols)
  "Set special variables named by SYMBOLS as file-local.
SYMBOLS need not be quoted."
  `(make-variables-file-local ,@(mapcar (lambda (symbol) (list 'quote symbol))
                                        symbols)))


(defmethod asdf:perform :around
    ((operation asdf:load-op) (file asdf-flv-mixin))
  "Establish new dynamic bindings for file-local variables."
  (progv *file-local-variables*
      (mapcar #'symbol-value *file-local-variables*)
    (call-next-method)))

(defmethod asdf:perform :around
    ((operation asdf:compile-op) (file asdf-flv-mixin))
  "Establish new dynamic bindings for file-local variables."
  (progv *file-local-variables*
      (mapcar #'symbol-value *file-local-variables*)
    (call-next-method)))

;;; asdf-flv.lisp ends here
