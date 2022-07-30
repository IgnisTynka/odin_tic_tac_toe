require_relative './board.rb'
require_relative './player.rb'

game_board = Board.new

game_board.draw

until game_board.is_full? || game_board.is_winner?()
    number = gets.chomp.to_i
    game_board.change_symbol(number)
    game_board.draw
end

if(game_board.is_winner?)
    if($player_move_id)
        puts "Player One win!"
    else
        puts "Player Two win!"
    end
else 
    puts "Draw!"
end