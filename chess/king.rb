require_relative "piece.rb"

class King < Piece
  include Stepable

  def symbol
    "♚".colorize(color)
  end

  protected

  def move_diffs
    [
      [-1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
    ]
  end
end
