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
    "#{current_inventory} #{current_container} of #{liquid} #{location}, ".capitalize +
    "#{current_inventory} #{current_container} of #{liquid}.\n" +
    "#{action}, " +
    "#{remaining_inventory} #{remaining_container} of #{liquid} #{location}.\n"
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

  def current_inventory
    case number
    when 0
      'no more'
    else
      number
    end
  end

  def remaining_inventory
    case number
    when 0
      99
    when 1
      'no more'
    else
      number - 1
    end
  end

  def current_container
    case number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def remaining_container
    case number
    when 2
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

