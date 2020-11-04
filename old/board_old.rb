require 'pry'

class Board
  attr_accessor :array, :start, :destination, :move1, :move2,
                :move3, :move4, :move5, :move6, :move7, :move8

  def initialize(array, start, destination)
    @array = array
    @start = Square.new(start)
    @destination = Square.new(destination)
    @knight = Knight.new()
  end
  # Level order
  def shortest_route(current_square=@start, output=[], route=[], continue=true)

    if current_square.coordinates == destination.coordinates
      find_prev(current_square)
    else
      output.push(current_square.move1) if current_square.move1
      output.push(current_square.move2) if current_square.move2
      output.push(current_square.move3) if current_square.move3
      output.push(current_square.move4) if current_square.move4
      output.push(current_square.move5) if current_square.move5
      output.push(current_square.move6) if current_square.move6
      output.push(current_square.move7) if current_square.move7
      output.push(current_square.move8) if current_square.move8
      first_square = output[0]
      route.push(current_square.coordinates)
      if output.empty?
        continue = false
      end
      output.shift
      if continue
        continue = true
        shortest_route(first_square, output, route, continue)
      else
        nil
      end
    end  
  end

  def find_prev(current_square, route=[])
    route.push(current_square.coordinates)
    # route.push(current_square.prev_square.prev_square.coordinates)
    # route.push(current_square.prev_square.prev_square.prev_square.coordinates)
    # route.push(current_square.prev_square.prev_square.prev_square.prev_square.coordinates)
    # route.push(current_square.prev_square.prev_square.prev_square.prev_square.prev_square.coordinates)
    return route if current_square.coordinates == start.coordinates
    find_prev(current_square.prev_square, route)
  end
  
  def build_board(current_square=start, squares=[])
    if squares.include?(current_square.coordinates)
      return nil
    end
    return nil if current_square.nil?
    find_children(current_square, squares)
    squares.push(current_square.coordinates)
    build_board(current_square.move1, squares) if current_square.move1
    build_board(current_square.move2, squares) if current_square.move2
    build_board(current_square.move3, squares) if current_square.move3
    build_board(current_square.move4, squares) if current_square.move4
    build_board(current_square.move5, squares) if current_square.move5
    build_board(current_square.move6, squares) if current_square.move6
    build_board(current_square.move7, squares) if current_square.move7
    build_board(current_square.move8, squares) if current_square.move8
    return start
  end
   
  def find_children(square, squares)
    # Move 1
    # binding.pry
    if squares.include?(square.coordinates)
      nil
    else
      square.move1 = Square.new([square.coordinates[0] + @knight.move1[0], square.coordinates[1] + @knight.move1[1]]) if 1 <= (square.coordinates[0] + @knight.move1[0]) && (square.coordinates[0] + @knight.move1[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move1[1]) && (square.coordinates[1] + @knight.move1[1]) < 9
      if square.move1
        square.move1.prev_square = square
      end
        # Move 2
      square.move2 = Square.new([square.coordinates[0] + @knight.move2[0], square.coordinates[1] + @knight.move2[1]]) if 1 <= (square.coordinates[0] + @knight.move2[0]) && (square.coordinates[0] + @knight.move2[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move2[1]) && (square.coordinates[1] + @knight.move2[1]) < 9
      if square.move2
        square.move2.prev_square = square
      end
      # Move 3
      square.move3 = Square.new([square.coordinates[0] + @knight.move3[0], square.coordinates[1] + @knight.move3[1]]) if 1 <= (square.coordinates[0] + @knight.move3[0]) && (square.coordinates[0] + @knight.move3[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move3[1])&& (square.coordinates[1] + @knight.move3[1]) < 9
      if square.move3
        square.move3.prev_square = square
      end
      # Move 4
      square.move4 = Square.new([square.coordinates[0] + @knight.move4[0], square.coordinates[1] + @knight.move4[1]]) if 1 <= (square.coordinates[0] + @knight.move4[0]) && (square.coordinates[0] + @knight.move4[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move4[1]) && (square.coordinates[1] + @knight.move4[1]) < 4
      if square.move4
        square.move4.prev_square = square
      end
      # Move 5
      square.move5 = Square.new([square.coordinates[0] + @knight.move5[0], square.coordinates[1] + @knight.move5[1]]) if 1 <= (square.coordinates[0] + @knight.move5[0]) && (square.coordinates[0] + @knight.move5[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move5[1]) && (square.coordinates[1] + @knight.move5[1]) < 9
      if square.move5
        square.move5.prev_square = square
      end
      # Move 6
      square.move6 = Square.new([square.coordinates[0] + @knight.move6[0], square.coordinates[1] + @knight.move6[1]]) if 1 <= (square.coordinates[0] + @knight.move6[0]) && (square.coordinates[0] + @knight.move6[0])< 9 && 1 <= (square.coordinates[1] + @knight.move6[1]) && (square.coordinates[1] + @knight.move6[1]) < 9
      if square.move6
        square.move6.prev_square = square
      end
      # Move 7
      square.move7 = Square.new([square.coordinates[0] + @knight.move7[0], square.coordinates[1] + @knight.move7[1]]) if 1 <= (square.coordinates[0] + @knight.move7[0]) && (square.coordinates[0] + @knight.move7[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move7[1]) && (square.coordinates[1] + @knight.move7[1]) < 9
      if square.move7
        square.move7.prev_square = square
      end
      #Move 8
      square.move8 = Square.new([square.coordinates[0] + @knight.move8[0], square.coordinates[1] + @knight.move8[1]]) if 1 <= (square.coordinates[0] + @knight.move8[0]) && (square.coordinates[0] + @knight.move8[0]) < 9 && 1 <= (square.coordinates[1] + @knight.move8[1]) && (square.coordinates[1] + @knight.move8[1]) < 9
      if square.move8
        square.move8.prev_square = square
      end
    end
  end
end