# gitgl

gitgl is a tool to automatically update all of your git repositories

## Usage

Run `gitgl` without any arguments to update all bookmarked repositories

### Flags

* `-a, --add [DIRECTORY]`        Bookmark the specified directory (or the current directory if one is not specified)
* `-d, --del [DIRECTORY]`        Remove the bookmark pointing to the specified directory (or the current directory if one is not specified)
* `-l, -list`	                 List the current bookmarks
* `-h, --help`                   Show the help menu

## Installation

Since gitgl is a simple shell script, it's not necessary for it to be installed. However, it can be copied to a location in the `PATH` environment variable so that it can be called as `gitgl` as opposed to `/path/to/gitgl/gitgl.sh`.

