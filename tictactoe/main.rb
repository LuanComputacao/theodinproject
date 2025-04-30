# frozen_string_literal: true

# Game
module Game
  def self.start_players
    puts 'Enter name for Player 1:'
    player1_name = gets.chomp
    player2_name = ''
    loop do
      puts 'Enter name for Player 2:'
      player2_name = gets.chomp
      break unless player1_name == player2_name || player2_name.empty?

      puts 'Player 2 name cannot be the same as Player 1. Please enter a different name.'
    end
    [player1_name, player2_name]
  end

  def self.print_panel(players)
    <<~PANEL
      ===============
      Player 1: #{players.player1.emoji}
      Player 2: #{players.player2.emoji}
      ===============
    PANEL
  end

  # Checker
  class Checker
    def self.check_winner(board, players)
      table = board.table
      emoji = check_rows(table) || check_columns(table) || check_diagonals(table)

      return players.player1 if players.player1.emoji == emoji
      return players.player2 if players.player2.emoji == emoji

      nil # No winner
    end

    def self.check_rows(table)
      table.each do |row|
        return row[0] if row[0] && row.uniq.size == 1
      end
      nil
    end

    def self.check_columns(table)
      (0..2).each do |col|
        column = table.map { |row| row[col] }
        return column[0] if column[0] && column.uniq.size == 1
      end
      nil
    end

    def self.check_diagonals(table)
      check_diagonal(table, [[0, 0], [1, 1], [2, 2]]) || check_diagonal(table, [[0, 2], [1, 1], [2, 0]])
    end

    def self.check_diagonal(table, positions)
      values = positions.map { |row, col| table[row][col] }
      values.first if values.uniq.size == 1 && values.first
    end
  end

  # Player
  class Player
    attr_reader :id, :name, :emoji

    def initialize(id, name, emoji)
      @id = id
      @name = name
      @emoji = emoji
    end

    def to_s
      "#{@name} => #{@emoji}"
    end
  end

  # Players
  class Players
    attr_reader :player1, :player2

    def initialize(player1_name, player2_name)
      @player1 = Game::Player.new(1, player1_name, '✖️')
      @player2 = Game::Player.new(2, player2_name, '⚫')
    end
  end

  # Board
  class Board
    attr_reader :table

    def initialize
      @table = Array.new(3) { Array.new(3) }
    end

    def turn_action(player, position_int)
      row, col = (position_int - 1).divmod(3)
      if @table[row][col].nil?
        @table[row][col] = player.emoji
      else
        raise 'Position already taken!'
      end
    end

    def to_s
      @table.map do |row|
        row.map { |cell| cell.nil? ? ' ' : cell }.join(' | ')
      end.join("\n---------\n")
    end
  end
end

# Main Game Logic
def play_game
  player1_name, player2_name = Game.start_players
  players = Game::Players.new(player1_name, player2_name)
  board = Game::Board.new

  puts Game.print_panel(players)
  winner = nil

  loop do
    current_player = board.table.flatten.count(nil).odd? ? players.player1 : players.player2
    puts "- - - - - - - - - - -"
    puts "#{current_player}"
    puts board

    begin
      puts 'Enter a position (1-9) or f to forfeit:'
      u_input = gets.chomp

      if u_input == 'f'
        puts "#{current_player.name} forfeited the game."
        break
      elsif u_input.match?(/^[1-9]$/)
        board.turn_action(current_player, u_input.to_i)
      else
        puts 'Invalid input. Please enter a number between 1 and 9 or f to forfeit.'
      end

      winner = Game::Checker.check_winner(board, players)
      break if winner
    rescue StandardError => e
      puts e.message
    end
  end

  puts "Winner: #{winner}" unless winner.nil?
  puts 'Game over. Run the game again to play another round.'
end

play_game
