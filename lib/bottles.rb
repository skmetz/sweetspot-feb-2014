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
    "#{inventory} #{container} of #{liquid} #{location}, ".capitalize +
    "#{inventory} #{container} of #{liquid}.\n" +
    "#{action}, " +
    "#{inventory(number-1)} #{container(number-1)} of #{liquid} #{location}.\n"
  end

  private

  def liquid
    'beer'
  end

  def location
    'on the wall'
  end

  def action
    case number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def inventory(i = number)
    case i
    when -1
      99
    when 0
      'no more'
    else
      i
    end
  end

  def container(i = number)
    case i
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    case number
    when 1
      'it'
    else
      'one'
    end
  end
end

