require_relative "piece.rb"

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def [](pos)
        x, y = pos
        self.rows[x][y]
    end

    def []=(pos,val)
        x, y = pos
        self.rows[x][y] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise "No piece at that position" if @rows[start_pos].nil? #may change later to nullpiece
        raise "Piece cannot move to that position" if !valid_pos?(end_pos) #may change with color
    end


    private
    attr_reader :null_piece
end