class Board  #need some changes and new method
    # WINNING_COMBINATIONS = [
    #     [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    #     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    #   ]
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
    end
    def draw 
        puts <<-HEREDOC
         #{@board[0]} | #{@board[1]} | #{@board[2]} 
        ---+---+---
         #{@board[3]} | #{@board[4]} | #{@board[5]} 
        ---+---+---
         #{@board[6]} | #{@board[7]} | #{@board[8]} 
        HEREDOC
    end
    def change_symbol(symbol, number)
        @board[number - 1] = symbol
    end
    def is_winner?(player_moves)
        end
    end
end

class Player
    attr_reader :name, :symbol
    $players = {}
    def initialize(name, symbol) #maybe need changes
        @name = name
        @symbol = symbol
        $players[@name] = @symbol
    end
end

