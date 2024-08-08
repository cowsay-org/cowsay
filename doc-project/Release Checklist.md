# Cowsay Release Checklist

## Creating a release

Steps to be done for a release:

1. Change version number in:
  a. `cowsay`
  b. `cowsay.1.adoc`
2. Rebuild the man page with `make man`.
3. Update the ChangeLog with the release date, and make sure it's up to date with changes.
4. Tag the release in git, in format "vX.Y.Z".
5. Create an X.Y-fixes branch, if this is a major or minor release. (But not for patch releases.)
6. Push the tag and new fixes branch to GitHub.
7. Create the release in [GitHub Releases](https://github.com/cowsay-org/cowsay/releases).
  a. Use the ChangeLog contents as the release comments.
8. Open development on next release.
  a. Bump the version in files listed above, and give it a "-SNAPSHOT" suffix.
  b. Update the ChangeLog with a section for the new release.

## Build environment

You may need to do some setup to get your environment working for a build, especially the `make man` part.

The cowsay build depends on Asciidoctor. (Not the old AsciiDoc. If you see `a2x` usage, that's old AsciiDoc stuff, and should be removed and replaced with `asciidoctor` calls.)
