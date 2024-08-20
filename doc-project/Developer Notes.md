Cowsay Developer Notes
======================

## Repo layout

* `<repo root>`
  * `bin/`             - cowsay and other commands
  * `share/`
    * `cowsay/`
      * `cows/`        - cow definition files
      * `site-cows/`   - doesn't exist, but you can create it for testing purposes
  * `man/`             - man pages (and source to build them)
  * `doc-project/`     - developer-facing documentation about this project
  * `cows-off/`        - broken cow files kept for reference
  * `CHANGELOG.md`     - user- and packager-facing change history documentation

The repo is organized this way so it matches the directory layout of the installation location for things like `bin/` and `share/`, reducing the need for special case code paths when running directly from the repo for development.

The `cows-off/` dir holds broken or unsupported cows that we might fix up and get mooing some day, including the never-finished .pm Perl module format cows. These are not part of the distribution and are not installed during installation.

## Building cowsay

As of 2024, cowsay uses Asciidoctor, not AsciiDoc, to build its man page and stuff. You must have Asciidoctor installed for `make man` and the like to work.

The man pages are built at code authoring time and checked in to the repo, instead of at `make install` time, so users do not need to have Asciidoctor installed in order to install cowsay.

## Releasing cowsay

See `doc-project/Release Checklist.md` for the steps needed to do a cowsay release.
