#!/bin/bash

for DIR in * ; do
if [[ -d $DIR/.git ]] ; then
	pushd "$DIR" >/dev/null 2>&1
	if [[ $(git status | grep 'nothing to commit') ]] ; then
		echo -e "$(tput bold)$(tput setaf 5)$DIR$(tput sgr0)$(tput setaf 6) is up to date.$(tput sgr0)"
	elif [[ $(git status | egrep -w 'Changes not staged|Uncommitted|unstage') ]] ; then
		echo -e "$(tput bold)$(tput setaf 5)$DIR$(tput sgr0)$(tput setaf 1) has untracked, uncommitted, or modified files."
	fi 
popd >/dev/null 2>&1
fi
done
