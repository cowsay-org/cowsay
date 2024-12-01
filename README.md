# cowsay

Cowsay is a configurable talking cow, written in Perl.  It operates much as the figlet program does, and is written in the same spirit of silliness.

## cowsay-org

This project you're looking at is [Andrew Janke](https://github.com/apjanke/)'s fork of Cowsay. It is an exercise in applying open source development and deployment practices to a small project. My hope is that this becomes the canonical modern, currently-maintained fork of Cowsay. But it's not really on its way there yet.

This fork is called "cowsay-org" where needed to distinguish it from the original Cowsay project. Otherwise, the program and project itself are still called "Cowsay".

The bulk of Cowsay's functionality is from Tony Monroe's original project. The cowsay-org fork primarily provides maintenance, hosting, and deployment support, plus support for random cow selection and pluggable third-party cow collections.

## Installation

Cowsay uses the standard `make`-based Unix program installation:

```bash
make install
```

or:

```bash
make install prefix=/path/to/installation/prefix
```

### Installation using Homebrew

On macOS/Linux, you can also install Cowsay using [Homebrew](https://brew.sh/):

```bash
brew install cowsay
```

## License

Cowsay is licensed under the [GNU GPL 3](https://www.gnu.org/licenses/gpl-3.0.en.html).

New code contributions to Cowsay (as of December 2024) are licensed under a dual license grant of GNU General Public License 1 or later and Artistic License 1.0.

Many of the files in Cowsay are licensed under a broader dual-licensing grant of GNU GPL 1 or later and the Artisitic License 1.0. But not _all_ of the files in Cowsay. The exact licensing situation is a little unclear here, and clarifying it is an ongoing project. See doc-project/Licensing.md for details. I am confident that the entirety of the Cowsay distribution may be used under GNU GPL 3 terms.

Sorry for the complexity here. I'm working on getting this simplified.

See the [LICENSE.txt](LICENSE.txt) and doc-project/Licensing.md files for details.

## History

Cowsay is actually a pretty old program. It was originally written by Tony Monroe and was first released in 1999, but was in use by Monroe for quite a while before that.

The first major version of Cowsay had one cow and one message template: `$foo is $verb $bar`.  Not very flexible, but people managed to do pretty interesting things with it.  The second major version scrapped many of the limitations of the first, by allowing arbitrary messages, multiple cowfiles, and even support for cows talking in figlet.  The third version was a rewrite of the second into Perl 5, whereupon the code got a lot smaller and more manageable. :-)

As of 2016, Monroe was no longer interested in maintaining Cowsay, and posted a [final 3.04 version on GitHub](https://github.com/tnalpgge/rank-amateur-cowsay) to make it available to other developers. [Andrew Janke](https://apjanke.net), a Cowsay fan, forked the project to provide ongoing maintenance and hosting for Cowsay, and as an exercise in FLOSS development processes. The cowsay-org GitHub organization is what Andrew created to host his fork's development.

## Requirements

Cowsay requires Perl 5.8.7 or later.

## Other cow collections

You can find collections of cowfiles for use with Cowsay in various third-party projects. Here's a list of some that look interesting:

* [paulkaefer/cowsay-files](https://github.com/paulkaefer/cowsay-files/)
* [bkendzior/cowfiles](https://github.com/bkendzior/cowfiles)

See the documentation in each for instructions on how to install them. You can also use Cowsay's `etc/cowsay/cowpath.d` mechanism to make Cowsay aware of them at a system-wide level, so users don't have to configure their `$COWPATH` variables themselves.

There's also cowsay-org's own [cows-offensive](https://github.com/cowsay-org/cows-offensive) collection, which holds cows that were historically in cowsay, but have been removed to keep the main cowsay distribution suitable for work and family use.

## Author

This cowsay-org fork of Cowsay is maintained by [Andrew Janke](https://github.com/apjanke), and hosted on GitHub at the [cowsay-org/cowsay repo](https://github.com/cowsay-org/cowsay).

## Enjoy

Enjoy Cowsay for what it was meant to be: simple and silly.
