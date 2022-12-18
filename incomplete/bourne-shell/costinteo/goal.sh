#!/bin/sh
CURR="g⟮⟯"
MAX_ALIAS_NUM=0
for line in $(cat $0)
do
	num=$(( $(echo $line | egrep -o '(⟮⟯)+' | wc -c) / 2 ))
	[ "$num" -gt "$MAX_ALIAS_NUM" ] && MAX_ALIAS_NUM=$num
done
alias g⟮al⟯="echo gal"
for i in $(seq 0 $MAX_ALIAS_NUM)
do
	alias ${CURR}⟮al⟯="echo ${CURR}al | sed 's/⟮⟯/o/g'"
	CURR="${CURR}⟮⟯"
done
g⟮al⟯
g⟮⟯⟮al⟯
g⟮⟯⟮⟯⟮al⟯
g⟮⟯⟮⟯⟮⟯⟮al⟯
