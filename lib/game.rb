class Game

    attr_accessor :board, :player_1, :player_2, :winning_combo

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]

    def initialize(player1 = Players::Human.new('X'), player2 = Players::Human.new('O'), board = Board.new)
        @board = board
        @player_1 = player1
        @player_2 = player2
    end

    def current_player
        if @board.turn_count == 0 || @board.turn_count.even?
            @player_1
        else
            @player_2
        end
    end

    def won?
        winner_switch = false
        @winning_combo = nil
        WIN_COMBINATIONS.any? do |combo|
            if @board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
              winner_switch = true
              @winning_combo = combo
            end
        end
        if winner_switch == true
            @winning_combo
        elsif @board.full? && winner_switch == false
            false
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        winner = nil
        if won?
            winner = @board.cells[@winning_combo[0]]
        end
        winner
    end

    def turn
        current_player.move(@board)
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end

    def start
        puts "Hello! Welcome to Tic Tac Toe!"
        puts "AI Mode: Enter '0' into the terminal."
        puts "1-Player Mode: Enter '1' into the terminal."
        puts "2-Player Mode: Enter '2' into the terminal."
        mode = gets.chomp

        case mode.to_s
            when '0'
                game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
                game.play
                puts "Enter 'Y' to play again, or 'Exit' to exit."
                input = gets.chomp
                    if input == 'Y' || input == 'y'
                        start
                    end
            when '1'
                puts "'X' plays first. 'O' plays second. Enter 1 to play first, or 2 to play second:"
                input_order = gets.chomp
                if input_order.to_s == '1'
                    player_1 = Players::Human.new('X')
                    player_2 = Players::Computer.new('O')
                else
                    player_1 = Players::Computer.new('X')
                    player_2 = Players::Human.new('O')
                end
                game = Game.new(player_1, player_2, Board.new)
                game.play
                puts "Enter 'Y' to play again, or 'Exit' to exit."
                input = gets.chomp
                    if input == 'Y' || input == 'y'
                        start
                    end
            when '2'
                game = Game.new(Players::Human.new('X'), Players::Human.new('O'), Board.new)
                game.play
                puts "Enter 'Y' to play again, or 'Exit' to exit."
                input = gets.chomp
                    if input == 'Y' || input == 'y'
                        start
                    end
            when 'wargames'
                100.times { 
                    game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
                    game.play 
                    }
            end     
    end

end
