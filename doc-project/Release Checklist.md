# Cowsay Release Checklist

Steps to be done for release:

1. Change version number in:
  a. cowsay file
  b. cowsay.1.adoc
2. Rebuild man page with `make man`
3. Update the ChangeLog with the release date, and make sure it's up to date with changes
4. Git tag the release
5. Create an X.Y-fixes branch, if this is a major or minor (non-patch) release
6. Create the release on GitHub
7. Open development on next release
  a. Bump version in files listed above, and give it a "-SNAPSHOT" suffix
  b. Update the ChangeLog with a section for the new release
