class NurseryRhyme
  PLOT = [
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

  def recite
    (1..PLOT.size).collect {|i| line(i)}.join("\n")
  end

  def line(number)
    "This is#{inner(number)}.\n"
  end

  def inner(number)
    (number - 1).downto(0).collect do |i|
      " the %s that %s" % [PLOT[i][0], PLOT[i][1]]
    end.join('')
  end

end

