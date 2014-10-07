class Fibonacci
  # Implement a method that will calculate the Nth number of the Fibonacci
  # sequence (http://en.wikipedia.org/wiki/Fibonacci_number)
  def self.calculate(n)
  	# Assign x and y to 0 and 1, respctively. This is the beggining of the
  	# modern Fibonacci sequence as described by wikipedia
  	x,y = 0,1

  	# x is assigned the value of y and y is assigned the sum of x and y
  	# the reason behind the dual assignment is that, if set individually,
  	# the value of x will be changed by the time y needs to be reassigned
  	n.times { |i| x,y = y, y + x }
  	
  	#return y
  	"Number at #{n}: #{y}"
  end

end

puts Fibonacci.calculate(7)