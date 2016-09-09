.PHONY: clean man man-old

clean:
	rm -f cowsay install.pl

# The man and man-old targets both create cowsay.1.adoc
# man-old is the old hand-coded man page; you can run it manually to
# get the old man page version
#
# The 'make man' targets are intended for use at write time, not build time,
# so they are not part of the normal build sequence, and their outputs are
# checked in to the source tree. This is partially to simplify the build 
# process, and partially to preserve the internal "update" timestamp inside
# the man pages.

man: cowsay.1

cowsay.1: cowsay.1.adoc
	a2x --format manpage ./cowsay.1.adoc

man-old:
	cp cowsay.1.in cowsay.1
	cp cowsay.1.in cowthink.1