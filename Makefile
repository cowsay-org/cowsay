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
LN = ln

.PHONY: clean man install uninstall

clean:
	@echo "Nothing to do - 'make clean' is a no-op."

# The 'man' target creates cowsay.1, cowthink.1, and other man pages.
#
# The 'man' target is intended for use at authoring time, not build time, so it is not
# part of the normal build sequence, and its outputs are checked in to the source tree.
# This is partially to simplify the build process, and partially to preserve the internal
# "update" timestamp inside the man pages. We do this at authoring/build time instead of
# install time to avoid introducing a dependency on Asciidoctor for users.

man: cowsay.1

cowsay.1: cowsay.1.adoc
	asciidoctor -b manpage cowsay.1.adoc

# This dependency specification is woefully incomplete, and assumes you'll just do a fresh
# install each time. This is probably fine.
install: cowsay cowsay.1 cowthink.1
	$(INSTALL) -d $(DESTDIR)$(prefix)
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) cowsay $(DESTDIR)$(bindir)/cowsay
	$(LN) -s cowsay $(DESTDIR)$(bindir)/cowthink
	$(INSTALL) -d $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowsay.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowthink.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -d $(DESTDIR)$(datadir)/cowsay
	cp -R share/cows $(DESTDIR)$(datadir)/cowsay
	$(INSTALL) -d $(DESTDIR)$(datadir)/cowsay/site-cows

uninstall:
	rm -f $(DESTDIR)$(bindir)/cowsay $(DESTDIR)$(bindir)/cowthink
	rm -f $(DESTDIR)$(mandir)/man1/cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	rm -rf $(DESTDIR)$(datadir)/cowsay
