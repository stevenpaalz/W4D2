require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize(board)
    @color = nil
    @board = board
    @pos = nil
  end

end
