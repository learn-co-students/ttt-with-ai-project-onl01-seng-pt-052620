module Players
    class Human < Player

        def move(board)
            
            board.display
            puts "Please enter an open cell, 1-9:"
            input = gets
            if board.valid_move?(input)
                board.update(input, self)
            else
                move(board)
            end
            input        

        end

    end
end