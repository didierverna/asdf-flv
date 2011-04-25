### Makefile --- ASDF-FLV

## Copyright (C) 2011 Didier Verna

## Author:        Didier Verna <didier@lrde.epita.fr>
## Maintainer:    Didier Verna <didier@lrde.epita.fr>

## This file is part of ASDF-FLV.

## Copying and distribution of this file, with or without modification,
## are permitted in any medium without royalty provided the copyright
## notice and this notice are preserved.


### Commentary:

## Contents management by FCM version 0.1.


### Code:

PROJECT := asdf-flv
VERSION := 1.0

W3DIR := $(HOME)/www/software/lisp/$(PROJECT)

DIST_NAME := $(PROJECT)-$(VERSION)
TARBALL   := $(DIST_NAME).tar.gz
SIGNATURE := $(TARBALL).asc


all:

clean:
	-rm *~

distclean: clean
	-rm *.tar.gz *.tar.gz.asc

update-version:
	perl -pi -e 's/:version ".*"/:version "$(VERSION)"/' \
	  com.dvlsoft.$(PROJECT).asd

tag:
	git tag -a -m 'Version $(VERSION)' 'version-$(VERSION)'

tar: $(TARBALL)
gpg: $(SIGNATURE)
dist: tar gpg

install-www: dist
	-install -m 644 $(TARBALL)   "$(W3DIR)/attic/"
	-install -m 644 $(SIGNATURE) "$(W3DIR)/attic/"
	echo "\
<? lref (\"$(PROJECT)/attic/$(PROJECT)-$(VERSION).tar.gz\", \
	 contents (\"Dernière version\", \"Latest version\")); ?> \
| \
<? lref (\"$(PROJECT)/attic/$(PROJECT)-$(VERSION).tar.gz.asc\", \
	 contents (\"Signature GPG\", \"GPG Signature\")); ?>" \
	  > "$(W3DIR)/latest.txt"
	chmod 644 "$(W3DIR)/latest.txt"
#	git push --tags "$(W3DIR)/clon.git" :
#	$(MAKE) gen TARGET=install-www
	cd "$(W3DIR)"					\
	  && ln -fs attic/$(TARBALL) latest.tar.gz	\
	  && ln -fs attic/$(SIGNATURE) latest.tar.gz.asc

$(TARBALL):
	git archive --format=tar --prefix=$(DIST_NAME)/	\
	    --worktree-attributes HEAD			\
	  | gzip -c > $@

$(SIGNATURE): $(TARBALL)
	gpg -b -a $<


.PHONY: all clean distclean update-version tag tar gpg dist


### Makefile ends here
