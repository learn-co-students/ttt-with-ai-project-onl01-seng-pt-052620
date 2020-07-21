module Players

    class Computer < Player

        def move(board)
            if board.cells[4] == " "
                computer_move = "5"
            elsif board.cells[0] == " "
                computer_move = "1"
            elsif board.cells[2] == " "
                computer_move = "3"
            elsif board.cells[6] == " "
                computer_move = "7"
            elsif board.cells[8] == " "
                computer_move = "9"
            elsif board.cells[1] == " "
                computer_move = "2"
            elsif board.cells[7] == " "
                computer_move = "8"
            elsif board.cells[3] == " "
                computer_move = "4"
            elsif board.cells[5] == " "
                computer_move = "6"
            end 
            computer_move
        end 

    end 

end 

