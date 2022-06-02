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

# Create and manage Player state
class Player
  @moves = []
  def initialize(name)
    @name = name
  end

  def choice(entry)
    @moves.push(entry)
  end
end

# pseudo code
# ask player 1 for name
# ask player 2 for name
# draw grid with co-ords for player to choose from
# ask #{player1.name} for co-ords
# check if co-ords are available and if (winning = true)
# draw new grid with player 1 choice
# ask #{player2.name} for co-ords
# check if co-ords are available and if (winning = true)

# winning conditions
#   1 2 3
# a _|_|_
# b _|_|_
# c  | |

# ['a1', 'a2', 'a3']
# ['b1', 'b2', 'b3']
# ['c1', 'c2', 'c3']
#
# ['a1', 'b1', 'c1']
# ['a2', 'b2', 'c2']
# ['a3', 'b3', 'c3']
#
# ['a1', 'b2', 'c3']
# ['c1', 'b2', 'a3']
#
