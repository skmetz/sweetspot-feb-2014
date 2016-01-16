require 'delegate'

class Fixnum
  def to_bottle_number
    case self
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(self)
  end
end

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

class BottleNumber1 < BottleNumber

  def action
    'Take it down and pass it around'
  end

  def container
    'bottle'
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
puts
puts "1 has quantity -> #{BottleNumber1.new(1).quantity}"
puts "1 has action -> #{BottleNumber1.new(1).action}"
puts "1 has container -> #{BottleNumber1.new(1).container}"

puts
puts "0 to_bottle_number"
puts 0.to_bottle_number.quantity
puts 0.to_bottle_number.action
puts 0.to_bottle_number.container
puts
puts "1 to_bottle_number"
puts 1.to_bottle_number.quantity
puts 1.to_bottle_number.action
puts 1.to_bottle_number.container
puts
puts "7 to_bottle_number"
puts 7.to_bottle_number.quantity
puts 7.to_bottle_number.action
puts 7.to_bottle_number.container

# add Fixnum.to_bottle_number
