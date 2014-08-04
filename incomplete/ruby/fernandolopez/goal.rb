$deep = 0
def _o
  rec = Proc.new { |al|
    $deep += 1
    calc = Proc.new {
      'G' + 'o' * $deep + 'al'
    }
    if al.nil?
      rec
    else
      calc.call
    end
  }
end
def g(al = nil)
  return 'Gal' unless al.nil?
  _o
end

p g('al')
p g()['al']
p g()[]['al']
p g()[][]['al']
p g()[][][]['al']
p g()[][][][]['al']

