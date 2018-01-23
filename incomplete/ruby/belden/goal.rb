#!/usr/bin/env ruby

BEGIN {
  def rewrite
    lines = File.read(__FILE__)
    lines.gsub!(/^__END__/, '')
    lines.gsub!(/^.*([d]ef g)/m, '\1')
    lines.gsub!(/(?<![d]ef g )\(\)/, '.call')
    lines
  end

  puts rewrite
}

def g (s=nil)
  @c = 0
  me = nil
  me = Proc.new { |s|
    if ! s.nil? && s == 'al'
      "g#{'o' * @c}al"
    else
      @c = @c + 1
      me
    end
  }
  me.call(s)
end

__END__
puts g('al')
puts g()()('al')
puts g()()()()()()('al')
