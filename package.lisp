;;; package.lisp --- Package definition

;; Copyright (C) 2011, 2015 Didier Verna

;; Author: Didier Verna <didier@didierverna.net>

;; This file is part of ASDF-FLV.

;; Copying and distribution of this file, with or without modification,
;; are permitted in any medium without royalty provided the copyright
;; notice and this notice are preserved.


;;; Commentary:

;; Contents management by FCM version 0.1.


;;; Code:

(in-package :cl-user)

(defpackage :net.didierverna.asdf-flv
  (:use :cl)
  (:export :make-variable-file-local))

;;; package.lisp ends here
