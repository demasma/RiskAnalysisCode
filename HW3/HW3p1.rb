#!/usr/bin/ruby

include Enumerable

# Computes the expected value of a list of probabilities and the
#   corresponding `cost'.
# http://stackoverflow.com/questions/7372489/whats-the-efficient-way-to-
#        multiply-two-arrays-and-get-sum-of-multiplied-values
#
def ExpectedValue(state_prob, payoff)
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

def MostLikely(state_prob, payoff)
  if state_prob.size == payoff.size
    puts "The most likely value is: #{sum}."
  else
    puts "Please check array sizes."
  end
end

def ExpOppLoss(state_prob, payoff, eM, eol)
  i, j, maxi, maxj = 0, 0, state_prob.size, payoff[0].size
  mu = payoff.transpose
  while j < maxj
    eM[j] = mu[j].max
    j += 1
  end
  i = 0
  while i < maxi
    j, sum = 0, 0
    while j < maxj
      sum = sum + state_prob[j] * (eM[j] - payoff[i][j])
      j += 1
    end
    eol[i] = sum 
    i += 1
  end
  puts "The minimum expected opportunity loss is #{eol.min} at #{eol.index(eol.min) + 1}th decision."
end

def Pessimistic(payoff, optmu)
  i, maxi = 0, payoff[0].size
  while i < maxi
    optmu[i] = [payoff[i].index(payoff[i].min), payoff[i].min]
    i += 1
  end
  puts "The optimal pessimistic payoff is #{optmu}."
end

def Optimistic(payoff, optmu)
  i, maxi = 0, payoff[0].size
  while i < maxi
    optmu[i] = [payoff[i].index(payoff[i].max), payoff[i].max]
    i += 1
  end
  puts "The optimal optimistic payoff is #{optmu}."
end

pr_s_i = [0.3, 0.5, 0.2]
mu_1 = [250, 100, -150]
mu_2 = [400, 220, -30]
mu_3 = [200, 100, 10]

mu_ij = [mu_1, mu_2, mu_3]

eM = Array.new
eol = Array.new
optmu = Array.new

puts "Small Crutches:"
ExpectedValue(pr_s_i, mu_1)
puts "Regular Crutches:"
ExpectedValue(pr_s_i, mu_2)
puts "Large Crutches:"
ExpectedValue(pr_s_i, mu_3)

ExpOppLoss(pr_s_i, mu_ij, eM, eol)

Pessimistic(mu_ij, optmu)
Optimistic(mu_ij, optmu)

# decisions = {"small" => {"excl" => [0.3, 250], 
#                          "good" => [0.5, 100], 
#                          "poor" => [0.2, -150]},
#              "regul" => {"excl" => [0.3, 400], 
#                          "good" => [0.5, 220], 
#                          "poor" => [0.2, -30]},
#              "large" => {"excl" => [0.3, 200], 
#                          "good" => [0.5, 100], 
#                          "poor" => [0.2, 10]}}
# 
# # decisions.each do |key, value|
# #   value.each do |state, payoff|
# #     puts "#{state} = #{payoff}"
# #   end
# # end
# 
# 
