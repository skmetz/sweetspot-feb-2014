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

