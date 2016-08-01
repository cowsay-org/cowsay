# cowsay

Cowsay is a configurable talking cow, written in Perl.  It operates
much as the figlet program does, and it written in the same spirit
of silliness.

## cowsay-apj

This project you're looking at is [Andrew Janke](https://github.com/apjanke/)'s fork of cowsay. It is an exercise in applying open source development and deployment practices to a small project. My hope is that this becomes the canonical modern fork of cowsay.

This fork is called "cowsay-apj" where needed to distinguish it from the original cowsay project. Otherwise, the program and project itself are still called "cowsay".

The bulk of cowsay's functionality is from Tony Monroe's original project. The cowsay-apj primarily provides maintenance, hosting, and deployment support.

## License

Cowsay is licensed under the GPLv3. See [LICENSE.txt](LICENSE.txt) for details.

## History

Cowsay is actually a pretty old program. It was originally written by Tony Monroe and was first released in 1999, but was in use by Monroe for quite a while before that.

The first major version of cowsay had one cow and one message template: $foo is $verb $bar.  Not very flexible, but people managed to do pretty interesting things with it.  The second major version scrapped many of the limitations of the first, by allowing arbitrary messages, multiple cowfiles, and even support for cows talking in figlet.  The third version was a rewrite of the second into Perl 5, whereupon the code got a lot smaller and more manageable. :-)

As of 2016, Monroe was no longer interested in maintaining cowsay, and posted a [final 3.04 version on GitHub](https://github.com/tnalpgge/rank-amateur-cowsay) to make it available to other developers. Andrew Janke, a cowsay fan, forked the project to provide ongoing maintenance and hosting for cowsay, and as an exercise in FLOSS development processes.

## Requirements

Cowsay requires Perl 5.005_03 or later.

## Enjoy

Enjoy cowsay for what it was meant to be: simple and silly.
