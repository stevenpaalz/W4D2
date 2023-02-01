require_relative "piece.rb"

class Bishop < Piece

    def symbol
        "♝".colorize(color)
    end

    include Slideable

    private
    def move_dirs
        diagonal_dirs
    end
end