class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    "#{inventory(number).to_s.capitalize} #{container(number)} of #{liquid} #{location}, " +
    "#{inventory(number)} #{container(number)} of #{liquid}.\n" +
    "#{action(number)}, " +
    "#{inventory(number-1)} #{container(number-1)} of #{liquid} #{location}.\n"
  end

  private

  def liquid
    'beer'
  end

  def location
    'on the wall'
  end

  def action(number)
    case number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def inventory(number)
    case number
    when -1
      99
    when 0
      'no more'
    else
      number
    end
  end

  def container(number)
    case number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(number)
    case number
    when 1
      'it'
    else
      'one'
    end
  end
end

