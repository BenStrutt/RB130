class PhoneNumber
  def initialize(number)
    @phone_number = number
  end
  
  def number
    phone_number.chars.each { |c| return "0000000000" if c =~ /[a-zA-Z]/ }
    num = phone_number.chars.select { |c| c =~ /[0-9]/ }.join
    num = num[1..-1] if num.size == 11 && num[0] == '1'
    num.size == 10 ? num : "0000000000"
  end
  
  def area_code
    number[0..2]
  end
  
  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
  
  private
  
  attr_reader :phone_number
end