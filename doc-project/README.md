# README - doc-project

This doc-project/ directory contains developer-facing documentation for people working on cowsay. It's not the user-facing documentation; that's in man/, man-src/, and the root README.md

## Dir layout

* `classic-docs-archive/` - Reference copies of original cowsay docs
  * `3.03/`               - Original cowsay docs from the 3.03 dist tarball
  * `3.04/`               - Original cowsay docs from the 3.04 GitHub repo posting
* `licensing-docs/`       - Supporting documentation about cowsay's licensing

The classic-docs-archive/ folder contains unchanged copies of some of the documentation files from Tony Moore's original Cowsay project, from before the cowsay-org fork. They're kept around for reference, in order to do things like establish file provenance, copyright and licensing situation, authorial intent, etc.

The 3.03/ subdir contains files in their state from the original classic cowsay 3.03 distribution tarball, which AFAICT was the last real release, and what some distro packagers like Debian are using.

The 3.04/ subdir contains files in their state from Tony's [rank-amateur-cowsay GitHub repo posting](https://github.com/tnalpgge/rank-amateur-cowsay) as of commit 99058032db7cafbc507a3fbe8cae6be2d9f65ee3 ("Documentation and licensing changes only" dated 2016-06-24), the final commit in that repo as of 2024-08-01.

Please do not modify any files in the classic-docs-archive/ directory, except to add files from other reference points, or to retroactively correct existing files to match the actual historical state from the upstream classic repo if there are errors in our copies of them.
