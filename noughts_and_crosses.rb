# frozen_string_literal: true

# Create Game instance to keep track of winning state
class Game
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

# Initialising Player and game
puts 'what is your name player 1?'
player1 = Player.new(gets.chomp)
puts 'what is your name player 2?'
player2 = Player.new(gets.chomp)
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
    player_choice = gets.chomp
    puts Player.valid_choice?(player_choice)
    puts current_game.available?(player_choice)
    if Player.valid_choice?(player_choice) && current_game.available?(player_choice)
      current_player.choice(player_choice)
      current_game.choice(player_choice)
      round += 1
    end
    playing = false if Game.winning?(current_player)
    # check if choice is available
      # if available
      # round +1
  end

end
