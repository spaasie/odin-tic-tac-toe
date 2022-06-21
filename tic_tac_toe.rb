# frozen_string_literal: true

# Create Game instance to keep track of winning state
class Game
  attr_reader :board

  WIN_COMBO = [
    %w[a1 a2 a3],
    %w[b1 b2 b3],
    %w[c1 c2 c3],
    %w[a1 b1 c1],
    %w[a2 b2 c2],
    %w[a3 b3 c3],
    %w[a1 b2 c3],
    %w[a3 b2 c1]
  ].freeze

  def initialize
    @total_choices = []
    @board_hash = {
      a1: '_',
      a2: '_',
      a3: '_',
      b1: '_',
      b2: '_',
      b3: '_',
      c1: ' ',
      c2: ' ',
      c3: ' '
    }
    @board = [
      '  1 2 3',
      "a #{@board_hash[:a1]}|#{@board_hash[:a2]}|#{@board_hash[:a3]}",
      "b #{@board_hash[:b1]}|#{@board_hash[:b2]}|#{@board_hash[:b3]}",
      "c #{@board_hash[:c1]}|#{@board_hash[:c2]}|#{@board_hash[:c3]}"
    ]
  end

  def self.winning?(player_object)
    self::WIN_COMBO.any? do |combo|
      combo.all? do |i|
        player_object.choices.include?(i)
      end
    end
  end

  def available?(player_choice)
    !@total_choices.include?(player_choice)
  end

  def choice(string)
    @total_choices.push(string)
  end

  def update_board(player1_choices, player2_choices)
    player1_choices.map { |i| @board_hash[i.to_sym] = 'x' }
    player2_choices.map { |i| @board_hash[i.to_sym] = 'o' }
    @board = [
      '  1 2 3',
      "a #{@board_hash[:a1]}|#{@board_hash[:a2]}|#{@board_hash[:a3]}",
      "b #{@board_hash[:b1]}|#{@board_hash[:b2]}|#{@board_hash[:b3]}",
      "c #{@board_hash[:c1]}|#{@board_hash[:c2]}|#{@board_hash[:c3]}"
    ]
  end
end

# Create a Player instance keeping track of choises and state
class Player
  attr_reader :name, :choices

  def initialize(name)
    @name = name
    @choices = []
  end

  def self.valid_choice?(string)
    # check if valid choice [a-c][1-3] regex
    string.match?(/[a-c][1-3]/)
  end

  def choice(string)
    @choices.push(string)
  end
end

def clear_lines(number)
  print "\r#{"\e[A\e[K" * number}"
end

# Initialising Player and game
puts 'what is your name player 1?'
player1 = Player.new(gets.chomp)
clear_lines(2)
puts 'what is your name player 2?'
player2 = Player.new(gets.chomp)
clear_lines(2)
current_game = Game.new

players = [player1, player2]
# Basic loop
playing = true
round = 0

while playing
  current_player = players[round % 2]
  if playing
    # ask player for choise
    puts "#{current_player.name} please choose a location"
    puts current_game.board
    player_choice = gets.chomp
    if Player.valid_choice?(player_choice) && current_game.available?(player_choice)
      clear_lines(6)
      current_player.choice(player_choice)
      current_game.choice(player_choice)
      round += 1
      current_game.update_board(player1.choices, player2.choices)
    else
      clear_lines(6)
    end
    playing = false if Game.winning?(current_player)
  end
end
