class Expection
  def backtrace; []; end
end

STDOUT.instance_eval do
  alias old_write write

  def write(str)
    case str
    when /g\(\)/
      str.gsub!('()', 'o')
      str.gsub!(/\(|\)|\"|\'/, '')
      old_write(str)
    when /^g/
      old_write(str)
    end
  end
end

def g(s = nil)
   print "g#{s}\n" if s
   nil
end


# Because ruby syntax check error.
# Please use the "irb goal.rb" or "irb < goal.rb" to run.

g('al')
g()('al')
g()()('al')
g()()()("al")
g()()()()("al")

