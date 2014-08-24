#!/bin/sh
 
tmux rename-window zsh #zshの部分はなんでもいい
# tmux new-window -n zsh #Windowを立ちあげて分割する場合はこっち
 
tmux split-window -h
tmux split-window -v -t zsh.0