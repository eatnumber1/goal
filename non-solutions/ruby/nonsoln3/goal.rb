def g(s = ?g)
  proc { |a| a ? (s + a) : g(s + ?o) }
end

g[][]['al'] # => "gooal"
g.().().('al') # => "gooal"
