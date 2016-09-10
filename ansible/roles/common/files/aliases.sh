#! /usr/bin/env bash

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias diffd="/usr/bin/diff -d -U"
alias ff="find -follow | grep -i"
alias gg="find . -name '*${2}' -print | xargs grep -nir '${1}';"

alias l.='ls -bdhlvL .* --color'
alias lsd='ls -ablhvL --color | grep ^d --color' # Only list directories, including hidden ones
alias ls="ls -hvFL --color"
alias ll="ls -abhlvFL --color"
