module Players
    class Computer < Player

        def move(board)

            board.display
            input = board_strategy(board)

            if board.valid_move?(input)
                board.update(input, self)
                input.to_s
            else
                move(board)
            end
            input.to_s

        end

        def board_strategy(board)
            second = [1,3,5,9]
            third = [2,4,6,8]
            if board.cells[4] == ' '
                5
            elsif board.cells[second.sample - 1] == ' '
                second.sample
            elsif board.cells[third.sample - 1] == ' '
                third.sample
            else
                rand 1..9
            end

        end

    end
end