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
  attr_reader :fragments

  def initialize(number)
    case number
    when 0
      @fragments = BeerVerseFragments0.new(number)
    when 1
      @fragments = BeerVerseFragments1.new(number)
    when 2
      @fragments = BeerVerseFragments2.new(number)
    else
      @fragments = BeerVerseFragments.new(number)
    end
  end

  def to_s
    "#{starting_inventory} #{starting_container} of #{liquid} #{location}, ".capitalize +
    "#{starting_inventory} #{starting_container} of #{liquid}.\n" +
    "#{action}, " +
    "#{ending_inventory} #{ending_container} of #{liquid} #{location}.\n"
  end

  private

  def liquid
    'beer'
  end

  def location
    'on the wall'
  end

  def starting_inventory
    fragments.starting_inventory
  end

  def starting_container
    fragments.starting_container
  end

  def action
    fragments.action
  end

  def ending_inventory
    fragments.ending_inventory
  end

  def ending_container
    fragments.ending_container
  end
end

class BeerVerseFragments
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def starting_inventory
    number
  end

  def starting_container
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def ending_inventory
    number - 1
  end

  def ending_container
    'bottles'
  end

  private

  def pronoun
    'one'
  end
end

class BeerVerseFragments0 < BeerVerseFragments

  def starting_inventory
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def ending_inventory
    99
  end

end

class BeerVerseFragments1 < BeerVerseFragments

  def starting_container
    'bottle'
  end

  def ending_inventory
    'no more'
  end

  private

  def pronoun
    'it'
  end

end

class BeerVerseFragments2 < BeerVerseFragments

  def ending_container
    'bottle'
  end

end

