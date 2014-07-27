o = lambda do |letter = 'o'|
  print letter
  print "\n" unless letter == 'o'
  o
end

g = lambda do |letter = 'o'|
  print 'g'
  print letter
  print "\n" unless letter == 'o'
  o
end

g.().('al')
g.().().().().('al')

g[]['al']
g[][][][]['al']
