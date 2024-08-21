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
	@echo "Nothing to do - 'make clean' is a no-op."

# The 'man' target creates cowsay.1, cowthink.1, and other man pages.
#
# The 'man' target is intended for use at authoring time, not at build time, so it is not
# part of the normal build sequence, and its outputs are checked into the source repo.
#
# This is partially to simplify the build process, and partially to preserve the internal
# "update" timestamp inside the man pages. We also do this at authoring time instead of
# install time to avoid introducing a dependency on Asciidoctor for users.

.PHONY: man
man: man-src/man1/cowsay.1.adoc man/man1/cowsay.1

# asciidoctor generates both cowsay.1 and cowthink.1, but the cowthink.1 uses an '.so'
# include macro that doesn't work on some systems, but symlinks do.
# cowthink.1 is generated as a side effect of cowsay.1, but I'm not sure how
# to declare that without a redundant target definition.
# Must delete any existing cowthink.1 symlink *first*, or it may clobber the cowsay.1 file
# with the wrong contents.
man/man1/cowsay.1: man-src/man1/cowsay.1.adoc
	mkdir -p man/man1
	rm -f man/man1/cowthink.1
	$(ASCIIDOCTOR) -b manpage -D man/man1 man-src/man1/cowsay.1.adoc
	rm -f man/man1/cowthink.1
	$(LN_S) cowsay.1 man/man1/cowthink.1

.PHONY: install
install:
	$(INSTALL_DIR) $(DESTDIR)$(cowpathdir)
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) bin/cowsay $(DESTDIR)$(bindir)/cowsay
	$(LN_S) cowsay $(DESTDIR)$(bindir)/cowthink
	$(INSTALL_DIR) $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) man/man1/cowsay.1 $(DESTDIR)$(mandir)/man1/cowsay.1
	$(LN_S) cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	$(INSTALL_DIR) $(DESTDIR)$(cowsdir)
	$(INSTALL_DATA) $(COW_FILES) $(DESTDIR)$(cowsdir)
	$(INSTALL_DIR) $(DESTDIR)$(sitecowsdir)

.PHONY: uninstall
uninstall:
	@set -e; \
	for f in \
	  $(DESTDIR)$(bindir)/cowsay \
	  $(DESTDIR)$(bindir)/cowthink \
	  $(DESTDIR)$(mandir)/man1/cowsay.1 \
	  $(DESTDIR)$(mandir)/man1/cowthink.1 \
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
