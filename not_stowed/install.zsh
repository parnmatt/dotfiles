#!/usr/bin/env zsh

self=${(%):-%x}

# ensure root user
if [[ $EUID != 0 ]]; then
    print 'Must be run as root, escalating privileges.'
    sudo $self
    exit
fi

# select all nodes
copy_nodes=(copy/*(:A))
link_nodes=(link/*(:A))

# make each node's parent, and symlink
for copy_node in $copy_nodes; do
    mkdir -p ${copy_node:h}
    cp -ai $copy_node ${copy_node:t:gs?:?/}
done

for link_node in $link_nodes; do
    mkdir -p ${link_node:h}
    ln -si $link_node ${link_node:t:gs?:?/}
done
