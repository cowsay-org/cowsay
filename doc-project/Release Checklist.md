# Cowsay Release Checklist

## Getting ready for a release

Once `main` seems ready for a release, test it out.

1. Test the code manually by playing around with `cowsay`.
2. Exercise all cows.
  a. `for cow in $(cowsay -l); do echo "${cow}:"; cowsay -f "$cow" moo; echo ''; done`
3. Install on macOS with `brew install --HEAD cowsay/cowsay-org`.
  a. Test `cowsay` as above.
  b. Test `man cowsay` and `man cowthink`.

## Creating a release

Steps to be done for a release:

1. Change version number in:
  a. `bin/cowsay`
  a. `man-src/man1/cowsay.1.adoc`
2. Rebuild the man pages with `make man`.
3. Update `CHANGELOG.md` with the release date, and make sure it's up to date with changes.
4. Commit those changes, with a commit message like "v X.Y.Z".
5. Tag the release in git, in format "vX.Y.Z", like `git tag vX.Y.Z`.
6. Create a `patches/vX.Y` branch, if this is a major or minor release. (But not for patch releases.)
7. Push the commits, tag, and new patches branch to GitHub.
8. Create the release in [GitHub Releases](https://github.com/cowsay-org/cowsay/releases).
  a. Use the CHANGELOG contents as the release comments.
9. Update the cowsay-org formula over in the [homebrew-cowsay Tap repo](https://github.com/cowsay-org/homebrew-cowsay) to use the new release.
10. Post a comment on the ["Moos & Announcements"](https://github.com/cowsay-org/cowsay/issues/48) issue.
11. Open development on next release, if this is a major or minor release.
  a. Bump the version in files listed above (`cowsay`, `cowsay.1.adoc`), and give it a "-SNAPSHOT" suffix.
  b. Update the CHANGELOG with a section for the new release.
  c. Rebuild the man pages with `make man`.
  d. Commit with a message like "Open development for X.Y", and push.
12. Don't bother doing the "open development on next" steps if this is a patch release; just remember to do that if and when you start a patch release for that minor series.

## Build environment

You may need to do some setup to get your environment working for a build, especially the `make man` part. The cowsay build depends on Asciidoctor. (Specifically Asciidoctory, not the old AsciiDoc and its `a2x` command.)

See the "Developer Notes.md" doc for more details. (Well, as soon as I get to writing more details.)
