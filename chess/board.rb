require_relative "piece.rb"
require_relative "null_piece.rb"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, nil) }
    @rows.each_with_index do |row, i|
      if i != 0 && i != 1 && i != 6 && i != 7
        8.times {row << NullPiece.instance }
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

