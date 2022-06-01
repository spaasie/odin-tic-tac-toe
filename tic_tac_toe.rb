=begin
  make 3 colomns namely 1, 2, 3
  make 3 rows namely a, b, c

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
    