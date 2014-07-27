(read; while read; do REPLY="${REPLY/(\'al\')/al}"; eval "${REPLY//()/o}"; done) < "$0"; exit

echo g()('al')
echo g()()()()('al')
