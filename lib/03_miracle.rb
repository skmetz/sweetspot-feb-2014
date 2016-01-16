require 'delegate'

class BottleNumber < SimpleDelegator

  def quantity
    __getobj__.to_s
  end

  def action
    'Take one down and pass it around'
  end

  def container
    'bottles'
  end
end


puts "7 has quantity -> #{BottleNumber.new(7).quantity}"
puts "7 has action -> #{BottleNumber.new(7).action}"
puts "7 has container -> #{BottleNumber.new(7).container}"


# This works great is you only ask for 2 through 99
