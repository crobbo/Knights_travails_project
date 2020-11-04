require_relative 'board.rb'
require_relative 'knight.rb'
require 'pry'
require_relative 'square.rb'

board = Board.new([1,1],[8,8])
board.add_square(board.start)
board.add_square(board.finish)
board.find
p board.shortest_path
# p board.squares[[5,2]]

# board.shortest_path



# board.possible_moves(board.finish)


# p board.finish.adjacent_squares[0].coordinates
# p board.finish.adjacent_squares[1].coordinates
# p board.finish.adjacent_squares[2].coordinates
# p board.finish.adjacent_squares[3].coordinates
# p board.finish.adjacent_squares[4].coordinates
# p board.finish.adjacent_squares[5].coordinates
# p board.squares[[5,8]]
