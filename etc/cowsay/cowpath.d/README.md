The cowsay `cowpath.d/` directory
=================================

You can drop files into this directory to extend the cowpath cowsay
uses to find cows.

Each such file MUST

  * be called `*.path`

  * contain only lines containing a directory (no comments, no empty
    lines, no extra space before or after)

An example file could be `/etc/cowsay/cowpath.d/foo-cows.path` containing

```
/usr/share/foo-cows/cows
```

which goes together with you `foo-cows` cow file package's cow file(s)
in `/usr/share/foo-cows/cows`.
