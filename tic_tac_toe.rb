class Board
    WINNING_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
      ]
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
        WINNING_COMBINATIONS.any? do |combination|
            player_moves.include?(combination)
        end
    end
end

class Player
    attr_reader :name, :symbol
    $players = {}
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        $players[@name] = @symbol
    end
end

board = Board.new
player_one = Player.new("Player one", "X")
player_one_moves = []
player_two = Player.new("Player two", "O")
player_two_moves = []
board.draw
puts $players

win = false
i = 0

until win || i == 9
    if i.even? 
        puts "#{player_one.name} choose field (1-9)"
        number = gets.chomp.to_i
        board.change_symbol(player_one.symbol, number)
    else
        puts "#{player_two.name} choose field (1-9)"
        number = gets.chomp.to_i
        board.change_symbol(player_two.symbol, number)
    end
    board.draw   
    i +=1              
end

