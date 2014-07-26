def g
  # whatever.
end

begin
  eval('g()()()()("al")')

rescue SyntaxError
  fail "faaaaaaaaaaaaaaaail"
end
