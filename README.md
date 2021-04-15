# Gnome-Pie

This fork of the project attempts to keep it compiling since the project is now depreciated and since the latest (as of April 2021) upstream version threw some compiler errors on my machine. 

You can find the original codebase [here](https://github.com/Schneegans/Gnome-Pie).

If you want to read the old README, see `README.old.md`.

## System requirements

- Have a version of `valac` installed that's higher than at least `0.24` (run `valac --version` to get your version number).
    - On Ubuntu 20.04, this can be installed with the `valac-bin` package, though some distros seem to already have it installed
- Has `msgfmt` installed
    - This is needed for the make script, thought it might be optional after all


## Compiling Instructions

[guides on Gnome-Pie's homepage](http://simmesimme.github.io/gnome-pie.html)

To compile the software, do the following:

- run `./make.sh`

