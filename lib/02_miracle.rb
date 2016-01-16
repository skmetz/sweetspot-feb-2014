require 'delegate'

class BottleNumber < SimpleDelegator

  def quantity
    __getobj__.to_s
  end

  def container
    'bottles'
  end
end


puts "7 has container -> #{BottleNumber.new(7).container}"
puts "7 has quantity -> #{BottleNumber.new(7).quantity}"


# Let's delegate to the Fixnum
#
# What happens if you add up BottleNumber objects ?
#
