global count = [];
function retval = g (al)
  global count;
  if (nargin > 0)
    out = strcat("g", count, al);
    count = [];
    retval = out;
  else
    count = [count "o"];
    retval = @g;
  end
end

g()("al")
g()()()()()()()()("al")