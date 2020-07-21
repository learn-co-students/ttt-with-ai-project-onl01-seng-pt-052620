require 'pry'

class Game
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]
    
    attr_accessor :board, :player_1, :player_2
      
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end 

    def start
        greeting
        game_type = game_choice

        if game_type == "0"
            Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board).play
        elsif game_type == "1"
            puts "Type 'me' or 'computer' to choose who you want to make the first move and be 'X'"
            second_input = gets.strip
                if second_input == "me"
                    Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board).play
                elsif second_input == "computer"
                    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board).play
                end 
        elsif game_type == "2"
            Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        end 

        puts "Would you like to start a new game (y/n)"
        start until gets.chomp == "n"

    end 

    def greeting
        puts "Welcome to Tic-Tac-Toe!"
    end 

    def game_choice
        puts "What type of game would you like to play? 0, 1, or 2 player?"
        @user_input = gets.strip
    end 

    def current_player
        if self.board.cells.count { |space| space == "X" || space == "O"}.even?
            self.player_1
        else 
            self.player_2
        end   
    end 

    def won?
        WIN_COMBINATIONS.detect do |winning_combo|
            @board.cells[winning_combo[0]] == @board.cells[winning_combo[1]] && 
            @board.cells[winning_combo[1]] ==  @board.cells[winning_combo[2]] &&
            (@board.cells[winning_combo[0]] == "X" || @board.cells[winning_combo[0]] == "O")
        end 
    end 

   def draw?
        if !won? && @board.full?
            return true 
        else 
            return false
        end
    end 

    def over?
        if won? || draw?
            return true
        else
            return false
        end 
    end 

    def winner
        array = won?
        if array
            @winner = @board.cells[array[0]]
        end 
    end 

    def turn
        player_now = current_player
        current_move = player_now.move(@board)
        if @board.valid_move?(current_move)
            @board.update(current_move, player_now)
            @board.display
        else
            turn
        end 
    end 

    def play
        until over?
            turn
        end 

        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat\'s Game!"
        end 
    end 
  

end 
