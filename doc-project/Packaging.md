# Packaging - Cowsay

This doc has notes about downstream packages of Cowsay, like Linux distros. Has info on both cowsay-org and classic cowsay packages. And some notes on how to make cowsay-org friendly to packagers.

Most of this is standard stuff you could find just by googling, and is collected here as a convenient list of links.

This info is current as of 2024-08.

## Trackers

These are metadata sources about which distros & package managers ship which cowsay. This gives you an overview of where all cowsay-org has been picked up.

* [Repology's cowsay tracker page](https://repology.org/project/cowsay/versions)

Repology's green/yellow/red labeling of the package versions doesn't mean much to me.

## Linux distros

### Arch Linux - cowsay-org

Arch Linux adopted cowsay-org in mid 2024.

* [cowsay package](https://archlinux.org/packages/extra/any/cowsay/)

### Debian - classic

Debian is shipping classic cowsay 3.03 with Debian patches, including additional cows, removing offensive cows, and added copyright info.

* sid (unstable)
  * [cowsay package](https://packages.debian.org/unstable/cowsay)
  * [cowsay-off package](https://packages.debian.org/unstable/cowsay-off) for offensive cows
  * [cowsay source package](https://packages.debian.org/source/sid/cowsay)
  * [cowsay source git repo](https://salsa.debian.org/debian/cowsay)

### Fedora - cowsay-org

Fedora adopted cowsay-org some time around 2021, with Fedora 36. (I think.) Before that, it was shipping classic cowsay 3.04. Contributor ndim works on the Fedora cowsay package.

* [cowsay package](https://packages.fedoraproject.org/pkgs/cowsay/cowsay/)

### Gentoo - cowsay-org

* [cowsay package](https://packages.gentoo.org/packages/games-misc/cowsay)

### OpenSUSE

Looks like OpenSUSE adopted cowsay-org as of openSUSE Leap 15.5.

* [cowsay package](https://build.opensuse.org/package/show/openSUSE:Leap:15.6:Update/cowsay)

## Homebrew - classic, deprecated

Homebrew ships classic Cowsay, removing some offensive cows. It is marked as deprecated as of 2023-11-22, and slated for removal one year later on 2024-11-22.

* [cowsay formula](https://github.com/Homebrew/homebrew-core/blob/master/Formula/c/cowsay.rb)
  * [as of 2024-08](https://github.com/Homebrew/homebrew-core/blob/46671fdd6629af52d4032cbd6eabe946efb92ca0/Formula/c/cowsay.rb) (in case the above link stops working)
* [commit deprecating cowsay](https://github.com/Homebrew/homebrew-core/commit/46671fdd6629af52d4032cbd6eabe946efb92ca0), with discussion in comments, including me plugging cowsay-org

```
[work] $ brew info cowsay | grep Depre
Deprecated because it has an archived upstream repository! It will be disabled on 2024-11-22.
[work] $
```

## MacPorts - cowsay-org

* [cowsay package](https://ports.macports.org/port/cowsay/summary/)

## FreeBSD

FreeBSD ships classic Cowsay, v. 3.04 as of 2024-08.

* [cowsay package](https://www.freshports.org/games/cowsay/)

## OpenBSD

I'm not sure what OpenBSD is shipping for Cowsay. It's called "cowsay-0.2.1v0", but looks like an "Acme-Cow" fork that does the new-style .pm format cows from classic Cowsay 3.04, but working? Plus [xcowsay](https://www.doof.me.uk/xcowsay/) 1.6.

* [search "cowsay" in OpenBSD packages](https://openbsd.app/?search=cowsay)
* [cowsay package in openbsd/ports repo](https://github.com/openbsd/ports/tree/master/games/cowsay)
* [Acme-Cow package on MetaCPAN](https://metacpan.org/dist/Acme-Cow)

Based on the Git history, looks like they switched to the Acme-Cow cowsay in 2022.

## References

* [Debian's Upstream Guide](https://wiki.debian.org/UpstreamGuide)
* [Ubuntu's Upstream Guide](https://wiki.ubuntu.com/UpstreamGuide)
 * [Preview of new revised Ubuntu Upstream Guide](https://canonical-ubuntu-packaging-guide.readthedocs-hosted.com/en/latest/explanation/upstream-and-downstream/)
* [Fedora Packaging Guidelines](https://docs.fedoraproject.org/en-US/packaging-guidelines/)
  * [Perl Packaging Guidelines](https://docs.fedoraproject.org/en-US/packaging-guidelines/Perl/)
  * [License Short Names and SPDX identifiers](https://docs.fedoraproject.org/en-US/packaging-guidelines/LicensingGuidelines/#_valid_license_short_names)
