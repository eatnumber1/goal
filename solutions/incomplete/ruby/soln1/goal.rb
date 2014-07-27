#!/usr/bin/env ruby

class Goal

  def initialize(depth = 0)
    @depth = depth
  end

  def [](suffix = nil)
    if suffix
      "g%s%s" % ["o" * @depth, suffix]
    else
      self.class.new(@depth + 1)
    end
  end

end

def g
  Goal.new
end

def test
  puts g['al']
  puts g[]['al']
  puts g[][]['al']
  puts g[][][]['al']
end

test
