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

SHELL = /bin/sh

# Make standard tools overridable, e.g. for testing with busybox.
ASCIIDOCTOR = asciidoctor
AWK = awk
CUT = cut
GREP = grep
EGREP = $(GREP) -E
INSTALL = install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_DIR = $(INSTALL) -d
LN = ln
LN_S = $(LN) -s
PRINTF = printf
SORT = sort
WC = wc

# If you implement support for *.pm cows, add share/cows/*.pm here.
#
# Note that this is a list of shell globs to be evaluated by the shell, not a list of
# files to be evaluated by make.
COW_FILES = share/cowsay/cows/*.cow

.PHONY: all
all:
	@echo "Nothing to do - 'make all' is a no-op."

.PHONY: clean
clean:
	rm -rf build

# The 'man' target creates cowsay.6, cowthink.6, and other man pages.
#
# The 'man' target is intended for use at authoring time, not at build time, so it is not
# part of the normal build sequence, and its outputs are checked into the source repo.
#
# This is to simplify the build process. We also do this at authoring time instead of
# install time to avoid introducing a dependency on Asciidoctor for end users, who may
# want to run directly from the repo without a build step.

.PHONY: man
man: man/man6/cowsay.6

# asciidoctor generates both cowsay.6 and cowthink.6, but the cowthink.6 uses an '.so'
# include macro that doesn't work on some systems, while symlinks do.
#
# We therefore have asciidoctor write all its output to a temporary
# directory and only move the cowsay.6 file over, not touching
# cowthink.6 at all.
#
# We also only move the cowsay.6 file over if the differences are more
# than just irrelevant metadata.
man/man6/cowsay.6: man-src/man6/cowsay.6.adoc man-src/normalize-manpage.sed
	@set -e; \
	if ! test -d build; then mkdir build; fi; \
	tmpdir="build/tmp$$$$"; \
	if $(ASCIIDOCTOR) -a reproducible -b manpage -D "$$tmpdir/man/man6" man-src/man6/cowsay.6.adoc; then \
	  if test -f man/man6/cowsay.6; then \
	    sed -f man-src/normalize-manpage.sed man/man6/cowsay.6 > "$$tmpdir/man/man6/normalized-old-cowsay.6"; \
	    sed -f man-src/normalize-manpage.sed "$$tmpdir/man/man6/cowsay.6" > "$$tmpdir/man/man6/normalized-new-cowsay.6"; \
	    if ! test -e "man/man6/cowsay.6" || ! cmp "$$tmpdir/man/man6/normalized-old-cowsay.6" "$$tmpdir/man/man6/normalized-new-cowsay.6" > /dev/null; then \
	      echo "Updating man/man6/cowsay.6"; \
	      mv -f "$$tmpdir/man/man6/cowsay.6" man/man6/cowsay.6; \
	    else \
	      echo "man/man6/cowsay.6 is up to date"; \
	    fi; \
	  else \
	    echo "Regenerating man/man6/cowsay.6"; \
		mv -f "$$tmpdir/man/man6/cowsay.6" man/man6/cowsay.6; \
	  fi; \
	  rm -rf "$$tmpdir"; \
	else \
	  echo "Error updating man/man6/cowsay.6"; \
	  exit 1; \
	fi

.PHONY: install
install:
	$(INSTALL_DIR) $(DESTDIR)$(cowpathdir)
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) bin/cowsay $(DESTDIR)$(bindir)/cowsay
	rm -f $(DESTDIR)$(bindir)/cowthink
	$(LN_S) cowsay $(DESTDIR)$(bindir)/cowthink
	$(INSTALL_DIR) $(DESTDIR)$(mandir)/man6
	$(INSTALL_DATA) man/man6/cowsay.6 $(DESTDIR)$(mandir)/man6/cowsay.6
	rm -f $(DESTDIR)$(mandir)/man6/cowthink.6
	$(LN_S) cowsay.6 $(DESTDIR)$(mandir)/man6/cowthink.6
	$(INSTALL_DIR) $(DESTDIR)$(cowsdir)
	$(INSTALL_DATA) $(COW_FILES) $(DESTDIR)$(cowsdir)
	$(INSTALL_DIR) $(DESTDIR)$(sitecowsdir)

.PHONY: uninstall
uninstall:
	@set -e; \
	for f in \
	  $(DESTDIR)$(bindir)/cowsay \
	  $(DESTDIR)$(bindir)/cowthink \
	  $(DESTDIR)$(mandir)/man6/cowsay.6 \
	  $(DESTDIR)$(mandir)/man6/cowthink.6 \
        ; do \
	  if test -f "$$f" || test -L "$$f"; then \
	    echo "rm -f $$f"; \
	    rm -f "$$f"; \
	  fi; \
	done
	@set -e; \
	for cow in $(COW_FILES); do \
	  dcow="$(DESTDIR)$(cowsdir)/$$(basename "$$cow")"; \
	  if test -f "$$dcow"; then \
	    echo "rm -f $$dcow"; \
	    rm -f "$$dcow"; \
	  fi; \
	done
	@set -e; \
	for dir in $(cowsdir) $(sitecowsdir) $(pkgdatadir) $(cowpathdir) $(pkgsysconfdir); do \
	  $(PRINTF) "%s\n" "$$dir"; \
	done \
	| $(AWK) '{ print length, $$0 }' | $(SORT) -n -r | $(CUT) -d" " -f2- \
	| while read dir; do \
	  if test "x$$($(PRINTF) "%s" "$$dir" | $(EGREP) '/.*/$(PACKAGE_TARNAME)(/|$$)' | $(WC) -c)" != x0; then \
	    dd="$(DESTDIR)$${dir}"; \
	    if test -d "$$dd"; then \
	      echo "rmdir $$dd"; \
	      rmdir "$$dd" ||:; \
	    fi; \
	  fi; \
	done
