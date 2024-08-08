Cowsay Changelog
================

## 3.9.0 (unreleased)

- Fix `cowsay -h` behavior, which would still wait for stdin input instead of exiting

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
