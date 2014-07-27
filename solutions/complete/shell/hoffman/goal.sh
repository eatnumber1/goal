{ read; while read; do REPLY="${REPLY/(\'al\')/al}"; eval "${REPLY//()/o}"; done } < "$0"

echo g()('al')
echo g()()()()('al')
exit
