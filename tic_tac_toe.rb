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
puts 'Please enter a name for player 1'
player_1_name = gets.chomp
puts "Thank you #{player_1_name}"

puts 'Please enter a name for player 2'
player_2_name = gets.chomp
puts "Thank you #{player_2_name}"

puts 'Lets start shall we?'

puts ' 1 2 3'
puts 'a_|_|_'
puts 'b_|_|_'
puts 'c | |'

puts "#{player_1_name} it is your turn please enter a co-ord"
player_1_choice = gets.chomp

player_1_marks = []
player_2_marks = []

player_1_marks.push(player_1_choice)

# print board with player 1 marks

# Board with co-ordinates for players to play on
class Board
  attr_reader :board

  @a1 = '_'
  @a2 = '_'
  @a3 = '_'
  @b1 = '_'
  @b2 = '_'
  @b3 = '_'
  @c1 = ' '
  @c2 = ' '
  @c3 = ' '

  @row_a = [
    'a ',
    @a1,
    '|',
    @a2,
    '|',
    @a3
  ]

  @row_b = [
    'b ',
    @b1,
    '|',
    @b2,
    '|',
    @b3
  ]

  @row_c = [
    'c ',
    @c1,
    '|',
    @c2,
    '|',
    @c3
  ]

  @board = [
    '  1 2 3',
    @row_a,
    @row_b,
    @row_c
  ]

  # def initialize
  #   [@a1, @a2, @a3, @b1, @b2, @b3].map { |variable| variable = '_' }
  #   [@c1, @c2, @c3].map { |variable| variable = ' ' }
  # end

  def call
    puts "here is : #{@a1}"
  end

  def show_board
    @board.each do |row|
      puts row
    end
  end
end

game = Board.new
p game.board
game.call

game.show_board
