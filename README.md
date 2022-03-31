# Marcel Dias' dotfiles

> My own macOS preferences and configurations for ZSH, Java, Docker, Terminals and others.

![screenshot][scrn]

[scrn]: https://raw.githubusercontent.com/marceldiass/dotfiles/main/screenshot.png

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read Caarlos0 post on the subject][post].

[post]: http://carlosbecker.com/posts/dotfiles-are-meant-to-be-forked/

## install

Run this:

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/marcel-dias/dotfiles/main/script/install)"
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Erlang" — you can simply add a `erlang` directory and
put files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/install.sh**: Any file with this name and with exec permission, will
ran at bootstrap phase.

## plugins

- [pure][pure] prompt (which is awesome!);
- fish-like [syntax highlight][zsh-syntax-highlighting];
- [more completions][zsh-completions];
- fish-like [substring history search][zsh-history-substring-search];
- [alias-tips][alias-tips] to remember you that you have an alias for that;
- [jvm][jvm] to manage java versions (a la rvm, but simpler);

All those are managed by [Antibody][antibody], a faster version of Antigen
written in Go.

[pure]: https://github.com/sindresorhus/pure
[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[zsh-completions]: https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]: https://github.com/zsh-users/zsh-history-substring-search
[alias-tips]: https://github.com/djui/alias-tips
[jvm]: https://github.com/caarlos0/jvm
[antibody]: https://github.com/caarlos0/antibody

## Test it within Docker

Yes you can! Pull the repo and run:

```sh
$ docker build -t dotfiles .
$ docker run -it dotfiles
```

It will start a fresh container with my dotfiles inside and dumb git credentials.


## thanks
I want to add my thanks to [caarlos0](http://github.com/caarlos0)
He forked [Holmans](http://github.com/holman)' excellent
[dotfiles](http://github.com/holman/dotfiles) and tweaked it. Also I have copied a bunch of things from other people, so, thanks everyone!
