.PHONY: clean man

clean:
	rm -f cowsay install.pl

# The target creates cowsay.1.adoc, and is included for convenience
#
# The 'make man' target is intended for use at write time, not build time,
# so it is not part of the normal build sequence, and its outputs are
# checked in to the source tree. This is partially to simplify the build 
# process, and partially to preserve the internal "update" timestamp inside
# the man pages.

man: cowsay.1

cowsay.1: cowsay.1.adoc
	a2x --format manpage ./cowsay.1.adoc

