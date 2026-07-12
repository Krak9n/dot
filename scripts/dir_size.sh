#!/usr/bin/env sh

function dir() {
		du -xhd 1 $1
}

dir $1 | sort -rhk 2 | less
