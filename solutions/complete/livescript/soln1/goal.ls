
#
# GOAL! - Livescript
#
# Requires node + livescript
#
# $ npm i -g LiveScript
# $ lsc goal.ls
#
# Author: github.com/lakmeer
#

# Implementation

g = (str, prefix = \g) ->
  if str
    prefix + that
  else
    (str) -> g str, prefix + \o


# Show-off one-liner version

g = (s, p=\g) -> if s then p+s else -> g it, p+\o


# Show that it works

{ equal } = require \assert

equal \gal,     g('al')
equal \goal,    g()('al')
equal \gooal,   g()()('al')
equal \goooal,  g()()()('al')
equal \gooooal, g()()()()('al')

