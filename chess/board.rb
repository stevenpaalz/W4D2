require_relative "piece.rb"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @rows.each_with_index do |row, i|
      if i == 0 || i == 1 || i == 7 || i == 6
        row.each_with_index do |col, j|
          row[j] = Piece.new
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    self.rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    self.rows[x][y] = val
  end

  def move_piece(color, start_pos, end_pos)
    raise "No piece at that position" if self[start_pos].nil? #may change later to nullpiece
    # raise "Piece cannot move to that position" if !valid_pos?(end_pos) #may change with color
    val = self[start_pos]
    self[end_pos] = val
    self[start_pos] = nil
  end

  private

  attr_reader :null_piece
end
