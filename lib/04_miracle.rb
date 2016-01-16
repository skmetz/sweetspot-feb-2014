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

class BottleNumber0 < BottleNumber

  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

end

puts
puts "7 has quantity -> #{BottleNumber.new(7).quantity}"
puts "7 has action -> #{BottleNumber.new(7).action}"
puts "7 has container -> #{BottleNumber.new(7).container}"
puts
puts "0 has quantity -> #{BottleNumber0.new(0).quantity}"
puts "0 has action -> #{BottleNumber0.new(0).action}"
puts "0 has container -> #{BottleNumber0.new(0).container}"

# add BottleNumber0
