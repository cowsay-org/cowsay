# Cowsay Release Checklist

## Getting ready for a release

Once `main` seems ready for a release, test it out.


## Creating a release

Steps to be done for a release:

1. Make a `release/vX.Y.Z` git branch for doing the release work and switch to it.
2. Do code changes for the release.
    1. Change version number in:
        1. `bin/cowsay`
        2. `man-src/man1/cowsay.1.adoc`
    2. Rebuild the man pages with `make man`.
    3. Update `CHANGELOG.md` with the release date, and make sure it's up to date with changes.
    4. Commit those changes, with a commit message like "v. X.Y.Z".
3. Test the final release code, on that branch.
    1. Test the code manually by playing around with `cowsay`.
    2. Exercise all cows.
        1. `for cow in $(cowsay -l); do echo "${cow}:"; cowsay -f "$cow" moo; echo ''; done`
    3. Install on macOS with `brew install --HEAD cowsay/cowsay-org`.
        1. Modify the cowsay-org formula in your local cowsay-org tap to point its HEAD at this release branch.
        2. Test `cowsay` as above.
        3. Test `man cowsay` and `man cowthink`.
4. Make the release for real in git.
    1. Merge your `release/vX.Y.Z` branch to main.
    2. Tag the release in git, in format "vX.Y.Z", like `git tag vX.Y.Z`.
    3. Create a `patches/vX.Y` branch, if this is a major or minor release. (But not for patch releases.)
    4. Push the commits, tag, and new patches branch to GitHub.
5. Create the release in [GitHub Releases](https://github.com/cowsay-org/cowsay/releases).
    1. Use the CHANGELOG contents as the release comments.
6. Update the cowsay-org formula over in the [homebrew-cowsay Tap repo](https://github.com/cowsay-org/homebrew-cowsay) to use the new release.
7. Announce the release.
    1. Post a comment on the ["Moos & Announcements"](https://github.com/cowsay-org/cowsay/issues/48) issue.
    2. Optionally, post comments on any big-ticket issues and PRs to let them know the release is out.
    3. Close the [milestone](https://github.com/cowsay-org/cowsay/milestones) in GH Issues for this release.
8. Open development on next release, if this is a major or minor release.
    1. Don't bother doing this "open development on next" step if it is a patch release; just remember to do that if and when you start a patch release for that minor series.
    2. Bump the version in files listed above (`cowsay`, `cowsay.1.adoc`), and give it a "-SNAPSHOT" suffix.
    3. Update the CHANGELOG with a section for the new release.
    4. Rebuild the man pages with `make man`.
    5. Commit with a message like "Open development for X.Y", and push.

## Build environment

You may need to do some setup to get your environment working for a build, especially the `make man` part. The cowsay build depends on Asciidoctor. (Specifically Asciidoctory, not the old AsciiDoc and its `a2x` command.)

See the "Developer Notes.md" doc for more details. (Well, as soon as I get to writing more details.)

Dependencies and tools needed:

1. Perl
    1. Use version 5.005_03 or later, but hopefully not too new (for compatibility). As of 2024-11, I'm testing against Perl 5.40. Really probably should be using whatever version is in the oldest in-support releases of Debian/Ubuntu and Fedora.
    2. Ideally, also test against the current Perl from Mac Homebrew.
2. Asciidoctor
    1. Version 2.0.x or later.
