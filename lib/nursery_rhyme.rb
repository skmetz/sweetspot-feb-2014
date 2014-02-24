class Incident < Struct.new(:this_is_the, :that)

  DEFAULT = [
    ['house',   'Jack built'],
    ['malt',    'lay in'],
    ['rat',     'ate'],
    ['cat',     'killed'],
    ['dog',     'worried'],
    ['cow with the crumpled horn',    'tossed'],
    ['maiden all forlorn',            'milked'],
    ['man all tattered and torn',     'kissed'],
    ['priest all shaven and shorn',   'married'],
    ['cock that crowed in the morn',  'woke'],
    ['farmer sowing his corn',        'kept'],
    ['horse and the hound and the horn', 'belonged to']
  ]

  def self.all(data=DEFAULT)
    data.collect {|incident| new(*incident)}
  end

end


class RandomIncident < Incident
  def self.all(data=Incident::DEFAULT)
    by_column = data.transpose
    thises  = by_column[0]
    thats   = by_column[1]

    random_thises   = thises.shuffle
    randomish_thats = thats.slice(1..-1).shuffle.unshift(thats.first)

    randomized = [random_thises, randomish_thats].transpose
    super(randomized)
  end
end

class NurseryRhyme
  attr_reader :incidents

  def initialize(incidents=Incident.all)
    @incidents = incidents
  end

  def recite
    (1..incidents.size).collect {|i| line(i)}.join("\n")
  end

  def line(number)
    "This is#{inner(number)}.\n"
  end

  def inner(number)
    (number - 1).downto(0).collect do |i|
      " the %s that %s" % [incidents[i].this_is_the, incidents[i].that]
    end.join('')
  end

end

