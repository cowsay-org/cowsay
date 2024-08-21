Cowsay Changelog
================

## 3.8.3 (unreleased)

### Changes

- Remove offensive cows "telebears" and "satanic", sending to cows-offensive. ([#46](https://github.com/cowsay-org/cowsay/issues/46))
- Improve Makefile, bringing more in line with GNU conventions, improve configurability, fix some `make uninstall` problems, etc. ([#26](https://github.com/cowsay-org/cowsay/pull/26)) (Thanks, Hans Niedermann!)
- Remove leftover "Listing cowfiles in pretty format" debugging output ([#50](https://github.com/cowsay-org/cowsay/issues/50))
- Fix "uninitialized value $tail" error in `cowsay -l` output for empty (zero-cowfile) cow dirs ([#50](https://github.com/cowsay-org/cowsay/issues/50))
- Fix installation location ("prefix") detection for cases like user-defined symlinks, and align repo layout with installation prefix dir layout ([#49](https://github.com/cowsay-org/cowsay/issues/49), [#55](https://github.com/cowsay-org/cowsay/issues/55))
- Remove broken .pm cows ([#54](https://github.com/cowsay-org/cowsay/issues/54))
  - Support for the .pm cowfile format never got implemented. This keeps non-working cows from appearing in the `cowsay -l` list and the like.
- Expand `cowsay --help` screen, and the man page a bit

### Internal changes

- Reorganize the repo to better match installation layout, and support running in-repo using `$PATH`.
- Remove some special-casing code for the in-repo execution mode.

## 3.8.2 (2024-08-16)

- Remove an offensive cow ([#46](https://github.com/cowsay-org/cowsay/issues/46))
  - It has been put to pasture in the new [cows-offensive](https://github.com/cowsay-org/cows-offensive) repo

## 3.8.1 (2024-08-08)

- Fix `cowsay -h` behavior, which would still wait for stdin input instead of exiting
- Fix `cowsay -n <args>` giving obtuse "undefined subroutine" error

## 3.8.0 (2024-08-08)

- Add "cupcake", "alpaca", and "fox" cows
- Fix "mech-and-cow" cow for file extension issue
- Fix "empbrace" typo in kiss.cow
- Better installation process, involving symlinks and stuff
- Migrate from AsciiDoc to Asciidoctor
- Make cowthink a symlink to cowsay
- Improve man page organization

## 3.7.0 (2020-05-28)

- `cowsay -r [-C]` for random cow
- Pluggable cow collections using etc/cowsay/cowpath.d
- Move cows/ and site-cows/ from $prefix/share/ to $prefix/share/cowsay/
- Parseable format for `cowsay -l` when sent to non-terminal destination
- Fix `cowsay -l` ignoring `*.pm` files
- Have `cowsay -l` recursively discover cowfiles in subdirectories

## 3.6.1 (2020-05-28)

- Fix version number

## 3.6.0 (2020-05-28)

- Support running from repo
- Simplify installation process

## 3.5.0 (2020-05-28)

- Add llama cow
- Changed to SemVer version numbering
- Remove leading zeros from version numbering

## 3.04.01

- Cowsay forked by Andrew Janke.
- Fixed version numbers in program and doco

## Tony Monroe's original cowsay from here on down

## 3.04 24 June 2016

- Licensing terms have changed to GPLv3.
- Friendlier to being hosted on GitHub.
- No functionality changes whatsoever.

## 3.03 28 May 1999

- Added cows/tux.cow, as suggested by xmanoel@i.am
- Compatibility with 5.6.0, due to a change in qw().
- Renamed devil.cow to daemon.cow, since I know better. :-)

## 3.02 04 November 1999

- Fixed boneheaded code placement so that cowsay -l actually works.

## 3.01 01 November 1999

- Fixed compatibility issues between the Text::Wrap module that changed between 5.005_02 and 5.005_03.
- Fixed tab expansion issues with Text::Tabs.

## 3.0 13 April 1999, released 14 August 1999

- Rewritten into Perl 5 and presented to the world.

## Not present in CVS from here on down

## 2.x Date?

- Arbitrary messages. 
- Figlet support (-n). 
- Line wrap length (-w). 
- Multiple pre-set expressions.
- Better arg parsing loop.
- Message from stdin or command line.

## 1.0 Date?

- SUBJECT is VERB OBJECT
