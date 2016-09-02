class Seq
  def initialize
    @counter = 0
  end
  
  def next
    @counter += 1
  end
end

s = Seq.new
10.times {puts s.next}
