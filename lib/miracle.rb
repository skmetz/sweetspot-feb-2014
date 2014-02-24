require 'delegate'

class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i| verse(i) + "\n"}.join
  end

  def verse(i)
    number = i.to_bottle_number
    "#{number} of beer on the wall, ".capitalize +
    "#{number} of beer.\n" +
    "#{number.action}, " +
    "#{number.next} of beer on the wall.\n"
  end
end

class Fixnum
  def to_bottle_number
    case self
    when 0
      BottleNumber0.new(self)
    when 1
      BottleNumber1.new(self)
    else
      BottleNumber.new(self)
    end
  end
end

class BottleNumber < SimpleDelegator
  def to_s
    "#{how_many} #{container}"
  end

  def action
    'Take one down and pass it around'
  end

  def next
    predecessor.to_bottle_number
  end

  private

  def predecessor
    ((self - 1) % 100)
  end

  def how_many
    __getobj__
  end

  def container
    'bottles'
  end
end

class BottleNumber1 < BottleNumber
  def action
    'Take it down and pass it around'
  end

  private

  def container
    'bottle'
  end
end

class BottleNumber0 < BottleNumber
  def action
    'Go to the store and buy some more'
  end

  private

  def how_many
    'no more'
  end
end
