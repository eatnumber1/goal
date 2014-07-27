def g(al = nil)
  @g ||= 'g'

  if al
    goal = (@g << al)
    @g = nil
    goal
  else
    @g << 'o'
    self.class.instance_method(__method__).bind(self)
  end
end

puts g().().().('al') #goooal
puts g().().('al')    #gooal
