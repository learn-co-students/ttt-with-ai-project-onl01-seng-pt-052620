module Players

    class Computer < Player

        def move(board)
            computer_move = rand(1..9).to_s
        end 

    end 

end 

# update(computer_move, self)
# board.cells[computer_move] = self.token
