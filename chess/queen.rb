require_relative "piece.rb"

class Queen < Piece

    include Slideable

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end