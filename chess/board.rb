require_relative "piece.rb"
require_relative "null_piece.rb"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @rows.each_with_index do |row, i|
      if i != 0 && i != 1 && i != 6 && i != 7
        row.each_with_index do |col, col_i|
          row[col_i] = NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(color, start_pos, end_pos)
    raise "No piece at that position" if self[start_pos].nil? #may change later to nullpiece
    # raise "Piece cannot move to that position" if !valid_pos?(end_pos) #may change with color
    value = self[start_pos]
    self[end_pos] = value
    self[start_pos] = nil
  end

  private

  # attr_reader :null_piece
end

require_relative "queen.rb"
require_relative "knight.rb"
require_relative "pawn.rb"
b = Board.new
# k = Knight.new("white", b, [7, 6])
# q = Queen.new("white", b, [5, 5])
# b[[7, 6]] = k
# b[[5, 5]] = q
# require "byebug"
# debugger
# # puts b[[4, 5]].empty?
# p k.moves
pawn = Pawn.new("white", b, [6, 2])
b[[6, 2]] = pawn

pawn2 = Pawn.new("white", b, [5, 3])
b[[5, 3]] = pawn

pawn3 = Pawn.new("black", b, [5, 1])
b[[5, 1]] = pawn

puts !b[[5,1]].empty?

p pawn.moves
# puts b[[5,2]].empty?
