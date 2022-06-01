=begin
  make 3 colomns namely 1, 2, 3
  make 3 rows namely a, b, c

  start:
    1 2 3
  a _|_|_
  b _|_|_
  c _|_|_

  rounds 2
    1 2 3
  a o|_|_
  b _|x|_
  c _|_|_

  late game
    1 2 3
  a o|o|x
  b _|x|o
  c _|x|o
  
  make player 1
  make player 2
=end

class Player

  @moves = []
  def initialize(name)
    @name = name
  end

  def choice(entry)
    @moves.push(entry)
  end

end
    