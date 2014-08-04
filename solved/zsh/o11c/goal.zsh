#!/usr/bin/zsh
# This solution uses no external commands and does not open itself as input.
# Shells do not support the concept of returning strings from functions.

debug_trap()
{
    if [[ "${ZSH_DEBUG_CMD/ }" == 'g('* ]]
    then
        local cmd
        cmd=${ZSH_DEBUG_CMD//'()'/o}
        rv=${cmd//[^a-z]/}
        echo $rv
        set -e
        return
    fi
}

al=1
trap debug_trap DEBUG

g()()()('al')
g()()('al')
g()('al')
g('al');
g()('at')
g()()('at')
g()()()('at')
