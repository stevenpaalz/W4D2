require_relative "piece.rb"

class Pawn < Piece

    def symbol
        "♟".colorize(color)
    end

    def moves
        # iterate through result of multiplying forward_dir by outputs of forward steps
        # test side each side attack if there is a piece at that position.
    end
    


    private

    def at_start_row?
        return true if self.pos[0] == 1 && self.color == "black"
        return true if self.pos[0] == 6 && self.color == "white"
        false
    end

    def forward_dir
        return 1 if self.color == "black"
        return -1 if self.color == "white"
    end

    # This will produce all of the possible forward vertical moves a pawn can make
    def forward_steps
        if at_start_row?
            return [[1,0], [2,0]] * forward_dir
        else
            return [[1,0]] * forward_dir
        end
    end

    # This will product all of the possible diagonal attacks a pawn can make
    def side_attacks

    end
end
