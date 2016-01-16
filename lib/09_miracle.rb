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

require 'forwardable'

class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    BeerVerse.new(number).to_s
  end
end

class BeerVerse
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    bottle_number = number.to_bottle_number
    "#{bottle_number.quantity} #{bottle_number.container} of #{liquid} #{location}, ".capitalize +
    "#{bottle_number.quantity} #{bottle_number.container} of #{liquid}.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.next.quantity} #{bottle_number.next.container} of #{liquid} #{location}.\n"
  end

  private

  def liquid
    'beer'
  end

  def location
    'on the wall'
  end
end

# Use BottleNumber in BeerSong

