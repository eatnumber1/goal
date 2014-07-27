(read; while read; do REPLY="${REPLY/(\'al\')/al}"; REPLY="${REPLY//()/o}"; eval "$REPLY"; done) < "$0"; exit

echo g()('al')
echo g()()()()('al')
