puts DATA.read.gsub("()","o").gsub("('al')","al")

__END__
g('al')
g()('al')
g()()('al')
g()()()('al')
