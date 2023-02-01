require_relative "piece.rb"

class Pawn < Piece
  def symbol
    "♟".colorize(color)
  end

  def moves
    # iterate through result of multiplying forward_dir by outputs of forward steps
    # test side each side attack if there is a piece at that position.
    result = []
    forward_steps.each do |step|
      new_pos = pos.dup
      new_pos[0] += step[0]
      new_pos[1] += step[1]
      if (new_pos[0] >= 0 && new_pos[0] <= 7) &&
         (new_pos[1] >= 0 && new_pos[1] <= 7) &&
         @board[new_pos].empty?
        result << [new_pos[0], new_pos[1]]
      end
    end
    side_attacks.each do |side|
      new_pos = pos.dup
      new_pos[0] += side[0]
      new_pos[1] += side[1]
      if (new_pos[0] >= 0 && new_pos[0] <= 7) &&
         (new_pos[1] >= 0 && new_pos[1] <= 7) &&
         !@board[new_pos].empty? &&
         @board[new_pos].color != self.color
        result << [new_pos[0], new_pos[1]]
      end
    end
    result
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
      return [[1 * forward_dir, 0], [2 * forward_dir, 0]]
    else
      return [[1 * forward_dir, 0]]
    end
  end

  # This will product all of the possible diagonal attacks a pawn can make
  def side_attacks
    position = [[1, 1], [1, -1]]
    position.each do |pos|
      pos[0] * forward_dir
    end
    return position
  end
end
