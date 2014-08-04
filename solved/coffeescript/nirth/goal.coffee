g = (sequence = '', ending = '') ->
    if ending is 'al' or sequence is 'al'
        return 'g' + sequence + ending
    else if ending is ''
        g.bind null, sequence + 'o'

console.info g()('al')
console.info g()()()()('al')
console.info g()()()()()()()()('al')
console.info g('al')
