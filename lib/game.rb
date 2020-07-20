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

    def current_player
        if self.board.cells.count { |space| space == "X" || space == "O"}.even?
            self.player_1
        else 
            self.player_2
        end   
    end 

    def won?
        WIN_COMBINATIONS.any? do |winning_combo|
           if @board.cells[winning_combo[0]] == @board.cells[winning_combo[1]] && 
            @board.cells[winning_combo[1]] ==  @board.cells[winning_combo[2]] && 
            @board.cells[winning_combo[0]] == "X" || @board.cells[winning_combo[0]] == "0"
                return winning_combo
            end 
        end 
    end 

    # def full?
    #     if @board.include?(" ") == false && won? == false
    #         return true
    #     else
    #         return false
    #     end 
    # end 
    

    # def draw?
    #     if !won? && full?
    #         return true
    #     else 
    #         return false
    #     end
    # end 
    
    # def over?
    #     if won? || draw?
    #         return true
    #     else
    #         return false
    #     end 
    # end 

end 
