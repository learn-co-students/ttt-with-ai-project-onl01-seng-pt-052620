module Players

    class Human < Player

        def move(board)
            board.display
            puts "To make a move, input the number of the space you want to occupy and press 'enter'" 
            user_input = gets.strip
        end 

    end 

end 










# if board.valid_move?(user_input)
#     board.cells[user_input.to_i - 1] = self.token
# end 