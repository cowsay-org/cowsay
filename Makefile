# Makefile for Cowsay

PACKAGE_TARNAME = cowsay

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
datarootdir = ${prefix}/share
datadir = ${datarootdir}
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
sysconfdir = ${prefix}/etc
mandir=${datarootdir}/man

pkgdatadir = ${datadir}/${PACKAGE_TARNAME}
cowsdir = ${pkgdatadir}/cows
sitecowsdir = ${pkgdatadir}/site-cows

pkgsysconfdir = ${sysconfdir}/${PACKAGE_TARNAME}
cowpathdir = ${pkgsysconfdir}/cowpath.d

srcdir = .

A2X = a2x
SHELL = /bin/sh
INSTALL = install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_DIR = $(INSTALL) -d
LN = ln
LN_S = $(LN) -s

# If you implement support for *.pm cows, add share/cows/*.pm here.
#
# Note that this is a list of shell globs to be evaluated by the
# shell, not a list of files to be evaluated by make.
COW_FILES = share/cows/*.cow

.PHONY: all
all: man

.PHONY: clean man install uninstall

clean:
	@echo Nothing to do.

# The target creates cowsay.1.adoc, and is included for convenience
#
# The 'make man' target is intended for use at write time, not build time,
# so it is not part of the normal build sequence, and its outputs are
# checked in to the source tree. This is partially to simplify the build 
# process, and partially to preserve the internal "update" timestamp inside
# the man pages. We do this at build time to avoid introducing a dependency on
# Asciidoc for users.

man: cowsay.1

cowsay.1: cowsay.1.adoc
	$(A2X) --format manpage ./cowsay.1.adoc

install: man
	$(INSTALL_DIR) $(DESTDIR)$(cowpathdir)
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) cowsay $(DESTDIR)$(bindir)/cowsay
	rm -f $(DESTDIR)$(bindir)/cowthink
	$(LN_S) cowsay $(DESTDIR)$(bindir)/cowthink
	$(INSTALL_DIR) $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowsay.1 $(DESTDIR)$(mandir)/man1/cowsay.1
	rm -f $(DESTDIR)$(mandir)/man1/cowthink.1
	$(LN_S) cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	$(INSTALL_DIR) $(DESTDIR)$(pkgdatadir)
	$(INSTALL_DIR) $(DESTDIR)$(cowsdir)
	$(INSTALL_DATA) $(COW_FILES) $(DESTDIR)$(cowsdir)
	$(INSTALL_DIR) $(DESTDIR)$(sitecowsdir)

uninstall:
	rm -f $(DESTDIR)$(bindir)/cowsay $(DESTDIR)$(bindir)/cowthink
	rm -f $(DESTDIR)$(mandir)/man1/cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	@set -e; for cow in $(COW_FILES); do dcow="$(DESTDIR)$(cowsdir)/$$(basename "$$cow")"; if test -f "$$dcow"; then echo "rm -f $$dcow"; rm -f "$$dcow"; fi; done
	@set -e; for dir in $(cowsdir) $(sitecowsdir) $(pkgdatadir) $(cowpathdir) $(pkgsysconfdir); do if test -d "$(DESTDIR)$${dir}"; then echo rmdir "$(DESTDIR)$${dir}"; rmdir "$(DESTDIR)$${dir}" ||:; fi; done
