require 'pry'

class Board
  attr_accessor :knight, :squares, :start, :finish

  def initialize(start, finish)
    @knight = Knight.new
    @start = Square.new(start)
    @finish = Square.new(finish)
    @squares = {}
  end

  def valid_input?
    if start.coordinates[0].between?(1,8) && start.coordinates[1].between?(1,8) && finish.coordinates[0].between?(1,8) && start.coordinates[1].between?(1,8)
      true
    else
      false
    end    
  end


  def add_square(square)
    # Improvement: check if square already exists. 
    @squares[square.coordinates] = square
  end

  def add_moves(square1, square2)
    @squares[square1.coordinates].add_move(@squares[square2.coordinates])
    @squares[square2.coordinates].add_move(@squares[square1.coordinates])
  end

  def possible_moves(current_square)
    @knight.moves.each do |move|
      square = [current_square.coordinates[0] + move[0], current_square.coordinates[1] + move[1]]
      if square[0].between?(1,8) && square[1].between?(1,8)
        if @squares.key?(square)
          adjacent_squares = @squares[square]
        else
          adjacent_squares = Square.new(square)
          @squares[square] = adjacent_squares
        end
        current_square.add_move(adjacent_squares)
      else
        nil
      end
    end
  end
  
  def find(current_square=start)
    queue = []
    visited_square = []
    levels = []
    until current_square == finish
      if visited_square.include?(current_square)
        nil
      else
        possible_moves(current_square)
        current_square.adjacent_squares.each do |square|
          queue << square
        end
        queue << current_square
        visited_square << current_square
      end
      queue.shift
      current_square = queue[0]
    end
    possible_moves(current_square)
  end

  def set_levels(current_square=start)
    levels =[]
    arr = []
    level = 1
    levels << [current_square.coordinates]
    current_square.adjacent_squares.each {|x|  arr << x.coordinates}
    levels << arr
    until levels[level].include?(finish.coordinates)
      arr = []
      levels[level].each_with_index do |square, i|
        squares[square].adjacent_squares.each {|x| arr << x.coordinates}
      end  

      levels << ((arr.uniq) - levels[level - 1])
      level += 1
    end
    array = levels.reverse
    array.shift
    return array
  end

  def shortest_path(current_square=finish, count=0, path=[finish.coordinates], levels=set_levels)
    return path.reverse if levels[count].nil?
    current_square.adjacent_squares.each do |square|
      break if path.include?(start.coordinates)
      if levels[count].include?(square.coordinates)
        path << square.coordinates
        current_square = squares[square.coordinates]
        count += 1
      end
    end
    shortest_path(current_square, count, path, levels)
  end
end