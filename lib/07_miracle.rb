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

  def next
    (self - 1).to_bottle_number
  end
end

class BottleNumber0 < BottleNumber

  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def next
    99.to_bottle_number
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
puts "0 to_bottle_number"
puts 0.to_bottle_number.quantity
puts 0.to_bottle_number.action
puts 0.to_bottle_number.container
puts 0.to_bottle_number.next
puts
puts "1 to_bottle_number"
puts 1.to_bottle_number.quantity
puts 1.to_bottle_number.action
puts 1.to_bottle_number.container
puts 1.to_bottle_number.next
puts
puts "7 to_bottle_number"
puts 7.to_bottle_number.quantity
puts 7.to_bottle_number.action
puts 7.to_bottle_number.container
puts 7.to_bottle_number.next

# add next/succ

