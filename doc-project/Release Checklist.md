# Cowsay Release Checklist

## Creating a release

Steps to be done for a release:

1. Change version number in:
  a. `cowsay`
  a. `cowsay.1.adoc`
2. Rebuild the man pages with `make man`.
3. Update `CHANGELOG.md` with the release date, and make sure it's up to date with changes.
4. Commit those changes, with a commit message like "v X.Y.Z".
5. Tag the release in git, in format "vX.Y.Z".
6. Create an X.Y-fixes branch, if this is a major or minor release. (But not for patch releases.)
7. Push the tag and new fixes branch to GitHub.
8. Create the release in [GitHub Releases](https://github.com/cowsay-org/cowsay/releases).
  a. Use the CHANGELOG contents as the release comments.
9. Open development on next release.
  a. Bump the version in files listed above (`cowsay`, `cowsay.1.adoc`), and give it a "-SNAPSHOT" suffix.
  b. Update the CHANGELOG with a section for the new release.
  c. Rebuild the man pages with `make man`.
  d. Commit with a message like "Open development for X.Y.Z", and push.

## Build environment

You may need to do some setup to get your environment working for a build, especially the `make man` part.

The cowsay build depends on Asciidoctor. (Not the old AsciiDoc. If you see `a2x` usage, that's old AsciiDoc stuff, and should be removed and replaced with `asciidoctor` calls.)

See the "Developer Notes.md" doc for more details. (Well, as soon as I get to writing more details.)
