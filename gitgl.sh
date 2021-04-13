#!/bin/sh

pull_all() {
	for repo in `cat ~/.config/gitgl/bookmarks`; do
		echo "  > \033[32mPulling \033[35m$(echo $repo | awk -F/ '{print $(NF)}')\033[0m"
		cd $repo
		git pull
	done
}

my_help() {
	echo "Usage: gitgl [-adhl] [DIRECTORY]"
	echo "If no arguments are given, update the bookmarked directories"
	echo "Options:"
	echo "  -a, --add [DIRECTORY]       Add a bookmark. Set the bookmark to a directory if it is specified, otherwise the current directory"
	echo "  -d, --del [DIRECTORY]       Delete a bookmark. If a directory is given, delete that. Otherwise delete the current directory"
	echo "  -l, --list                  List the bookmarks"
	echo "  -h, --help                  Show this screen and exit"
}


# update all
if [ ! $1 ]; then
	pull_all
	exit
fi

# show help menu
if [ "$1" = '-h' -o "$1" = '--help' ]; then
	my_help
	exit

# add bookmark
elif [ "$1" = '-a' -o "$1" = '--add' ]; then
	if [ ! $2 ]; then
		printf $PWD >> ~/.config/gitgl/bookmarks
	else
		printf `realpath "$2"` >> ~/.config/gitgl/bookmarks
	fi

# delete bookmark
elif [ "$1" = '-d' -o "$1" = '--del' ]; then
	delete_bookmark_name=""
	if [ ! $2 ]; then
		delete_bookmark_name=$PWD
	else
		delete_bookmark_name=`realpath "$2"`
	fi

	escaped_name=$(echo $delete_bookmark_name | sed 's/\//\\\//g')

	sed -i "/$escaped_name/d" ~/.config/gitgl/bookmarks

elif [ "$1" = '-l' -o "$1" = '--list' ]; then
	cat ~/.config/gitgl/bookmarks
	echo
fi

