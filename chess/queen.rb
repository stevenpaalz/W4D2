require_relative "piece.rb"

class Queen < Piece
  #   def initialize()
  #     super
  #   end

  def symbol
    "♛".colorize(color)
  end

  include Slideable

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end
