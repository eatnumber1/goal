# This file can't be executed directly, rbx runner.rb instead.

def g(str='o')
  Class.new(String) do
    def method_missing(name, *args)
      name =~ /al|call/ ? self << (args[0] || name.to_s.sub('call', 'o')) : super
    end
  end.new('g' + str)
end

puts g()('al')
puts g('al')
puts g()()()()()()()al
