#! /usr/bin/env ruby

# Simply execute this file and any code after __END__
# shall be executed in accordance to the rules set fourth
# by https://github.com/eatnumber1/goal

class Goal
  METHOD_MATCHER = %r{g(\(\))*\('([[:alpha:]]+)'\)}

  def initialize(text = nil, depth = 0)
    @depth = depth
    @text = text
  end

  def to_s
    'g' + ('o' * @depth) + @text.to_s
  end
end

def hackety_hack(code)
  begin
    result = eval(code)
    return code.chomp, result

  rescue Exception => exception
    raise exception unless exception.is_a? SyntaxError
    matches = exception.message.match Goal::METHOD_MATCHER

    goal = Goal.new(
      matches.captures.last,
      matches.to_a.first.scan(matches.captures.first).size
    )

    return code.chomp, goal
  end
end

def g(al = nil)
  Goal.new(al)
end

DATA.each_line do |line|
  code, result = hackety_hack(line)
  puts format('%s # => %s', code, result)
end

__END__
g()
g('al')
g()('al')
g()()('al')
g()()()()()('al')
