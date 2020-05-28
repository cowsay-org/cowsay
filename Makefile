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
srcdir = .

SHELL = /bin/sh
INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = ${INSTALL} -m 644

.PHONY: clean man install uninstall

clean:
	rm -f cowsay install.pl

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
	a2x --format manpage ./cowsay.1.adoc

install: cowsay.1
	$(INSTALL) -d $(DESTDIR)$(prefix)
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) cowsay $(DESTDIR)$(bindir)/cowsay
	$(INSTALL_PROGRAM) cowthink $(DESTDIR)$(bindir)/cowthink
	$(INSTALL) -d $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowsay.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowthink.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -d $(DESTDIR)$(datadir)
	cp -R share/cows $(DESTDIR)$(datadir)
	$(INSTALL) -d $(DESTDIR)$(datadir)/site-cows

uninstall:
	rm -f $(DESTDIR)$(bindir)/cowsay $(DESTDIR)$(bindir)/cowthink
	rm -f $(DESTDIR)$(mandir)/man1/cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	rm -rf $(DESTDIR)$(datadir)/cows
