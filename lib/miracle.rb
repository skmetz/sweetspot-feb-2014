class BottleNumber
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def quantity
    num.to_s
  end

  def container
    'bottles'
  end
end


puts "7 has container -> #{BottleNumber.new(7).container}"
puts "7 has quantity -> #{BottleNumber.new(7).quantity}"
