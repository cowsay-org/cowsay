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
  * `archive/`         - currently-unused stuff kept for reference
    * `cows-off/`      - broken cow files, including unsupported .pm format cows
  * `CHANGELOG.md`     - user- and packager-facing change history documentation

The repo is organized this way so it matches the directory layout of the installation location for things like `bin/` and `share/`, reducing the need for special case code paths when running directly from the repo for development.

The `archive/cows-off/` dir holds broken or unsupported cows that we might fix up and get mooing some day, including the never-finished .pm Perl module format cows. These are not part of the distribution and are not installed during installation. The `archive/` dir collects all unused stuff under a top-level directory, which is alphabetized out of the midst of the rest of the top dirs.

## Building cowsay

As of 2024, cowsay uses Asciidoctor, not AsciiDoc, to build its man page and stuff. You must have Asciidoctor installed for `make man` and the like to work.

The man pages are built at code authoring time and checked in to the repo, instead of at `make install` time, so users do not need to have Asciidoctor installed in order to install cowsay.

## Dev setup and testing cowsay

The repo layout is organized to mimic the directory structure of the installed cowsay, so you can set up your `$PATH` to run cowsay from it, instead of the system installation location, with unqualified `cowsay` and `man cowsay` commands, instead of having to say e.g. `./bin/cowsay`. To do so, cd to the repo and run `PATH="$PWD/bin:$PATH`. (The man pages get picked up on the manpath automatically as a result of that; probably no need to set `$MANPATH` separately.) That's how I do testing as of 2024-08, and I'm thinking that future test or automation scripts will be written to work that way, instead of adding code paths to call the local `cowsay` using a full path to it. I think this approach is a good way to mimic how cowsay will work once installed.

## Releasing cowsay

See `doc-project/Release Checklist.md` for the steps needed to do a cowsay release.
