require_relative "piece.rb"

class Queen < Piece

  def symbol
    "♛".colorize(color)
  end

  include Slideable

  private
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end
