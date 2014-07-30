let s:o = 0
function! s:g(...)
  if len(a:000) > 0
    let r = 'g' . repeat('o', s:o) . join(a:000, '')
    let s:o = 0
    return r
  endif
  let s:o += 1
  return function('s:g')
endfunction

echo s:g()()('al')
echo s:g('al')
echo s:g()()()()()()()()()()()()()()()('al')
