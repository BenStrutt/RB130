require 'pry'

class Triplet
  def initialize(*nums)
    @nums = nums
    @a, @b, @c = nums
  end
  
  def sum
    nums.sum
  end
  
  def product
    nums.inject(&:*)
  end
  
  def pythagorean?
    a ** 2 + b ** 2 == c ** 2
  end
  
  def self.where(max_factor: nil, min_factor: 1, sum: nil)
    triplets = []
    (min_factor...max_factor).each do |m|
      (min_factor...max_factor).each do |n|
        c = Math.sqrt(m ** 2 + n ** 2)
        sum_verify = (sum.nil? ? true : m + n + c.to_i == sum)
        verification = c == c.to_i && m < n && sum_verify
        triplets << Triplet.new(m, n, c.to_i) if verification
      end
    end
    triplets
  end
  
  private
  
  attr_reader :nums, :a, :b, :c
end