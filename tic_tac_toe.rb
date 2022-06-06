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

# Basic mold for a player
class Player
  attr_reader :name, :player, :marks

  @@player_num = 0
  @@win_combo = [
    %w[a1 a2 a3],
    %w[b1 b2 b3],
    %w[c1 c2 c3],
    %w[a1 b2 c3],
    %w[a3 b2 c1],
    %w[a1 b1 c1],
    %w[a2 b2 c2],
    %w[a3 b3 c3]
  ]
  @@all_marks = []
  def initialize(name)
    @@player_num += 1
    @player = @@player_num
    @name = name
    @marks = []
  end

  def winning?
    @@win_combo.any? do |arr|
      arr.all? do |i|
        marks.include?(i)
      end
    end
  end

  def co_ord(co_ord)
    if !@@all_marks.include?(co_ord)
      @@all_marks.push(co_ord)
      @marks.push(co_ord)
    else
      puts "#{co_ord} has already been chosen"
    end
  end
end
# pseudo code
# ask player 1 for name

puts 'Please enter a name for player 1'
# player_1_name = gets.chomp
player_1_name = gets.chomp
player1 = Player.new(player_1_name)
puts "Thank you #{player1.name}"

# ask player 2 for name
puts 'Please enter a name for player 2'
player_2_name = gets.chomp
player2 = Player.new(player_2_name)
puts "Thank you #{player2.name}"

# draw grid with co-ords for player to choose from
puts 'Lets start shall we?'
puts 'Please select a location to make your mark e.g. a1 or b2'
puts '  1 2 3'
puts 'a _|_|_'
puts 'b _|_|_'
puts 'c  | |'

# ask #{player1.name} for co-ords
puts "#{player_1_name} it is your turn please enter a co-ord"
player_1_choice = gets.chomp
# player_1_marks = []
# player_1_marks.push(player_1_choice)
player1.co_ord(player_1_choice)
puts player1.player
puts player1.marks

# check if co-ords are available and if (winning = true)
# win_combo = [
#   %w[a1 a2 a3],
#   %w[b1 b2 b3],
#   %w[c1 c2 c3],
#   %w[a1 b2 c3],
#   %w[a3 b2 c1],
#   %w[a1 b1 c1],
#   %w[a2 b2 c2],
#   %w[a3 b3 c3]
# ]


# puts winning?(player_1_marks)
# draw new grid with player 1 choice
# ask #{player2.name} for co-ords
puts "#{player_2_name} it is your turn, please enter a co-ord"
player_2_choice = gets.chomp
# player_2_marks = []
player2.co_ord(player_2_choice)
# check if co-ords are available and if (winning = true)
# print board with player 1 marks

# Board with co-ordinates for players to play on
