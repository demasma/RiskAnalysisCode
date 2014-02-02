#!/usr/bin/ruby

# Computes the expected value of a list of probabilities and the
#   corresponding `cost'.
# http://stackoverflow.com/questions/7372489/whats-the-efficient-way-to-
#        multiply-two-arrays-and-get-sum-of-multiplied-values
#
def expected_value(state_prob, payoff)
  if state_prob.size == payoff.size
    sum, i, size = 0, 0, state_prob.size
    while i < size
      sum += state_prob[i] * payoff[i]
      i += 1
    end
    puts "The expected value is: #{sum}."
  else
    puts "Please check array sizes."
  end
end

 

pr_s_i = [0.3, 0.5, 0.2]
mu_1 = [250, 100, -150]
mu_2 = [400, 220, -30]
mu_3 = [200, 100, 10]

puts "Small Crutches:"
expected_value(pr_s_i, mu_1)
puts "Regular Crutches:"
expected_value(pr_s_i, mu_2)
puts "Large Crutches:"
expected_value(pr_s_i, mu_3)
