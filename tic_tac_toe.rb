class Board  
    $player_move_id = 0
     WINNING_COMBINATIONS = [
         [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
         [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
      ]
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
        @player_one = Player.new("PlayerOne", "X")
        @player_two = Player.new("PlayerTwo", "O")
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
    def change_symbol(number)
        if @board[number - 1].to_s.match?(/[[:alpha:]]/)
            return 
        else 
            if $player_move_id.even?
                @board[number - 1] = @player_one.symbol
                $player_moeve_id = 1
            else
                @board[number - 1] = @player_two.symbol
                $player_moeve_id = 0
            end
        end
            
    end
    def is_full?()
        @board.all? do |cell|
            cell.to_s.match?(/[[:alpha:]]/)
        end
    end
    def is_winner?(symbol)
        WINNING_COMBINATIONS.each do |combination| 
            if @board[combination[0]].to_s == symbol && @board[combination[1]].to_s == symbol && @board[combination[2]].to_s == symbol
                return true
            end                
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

game_board = Board.new


until game_board.is_full?
    number = gets.chomp.to_i
    game_board.change_symbol(number)
    game_board.draw
end


