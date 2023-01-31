
class Piece

    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end


end


module Slideable
    def horizontal_dirs
        result = []
        row = self[pos[0]]
        row.each_with_index do |col, i|
            if (col == nil && row[i...pos[1]].all? {|ele| ele == nil}) ||
            (col == nil && row[pos[1]+1..i].all? {|ele| ele == nil})
                result << [pos[0], i]
    end
end

module Stepable
    
end