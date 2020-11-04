class Square
  attr_reader :coordinates, :adjacent_squares
  
  def initialize(coordinates)
    @coordinates = coordinates
    @adjacent_squares = [].sort
  end
  
  def add_move(adjacent_squares)
    @adjacent_squares << adjacent_squares
  end
end