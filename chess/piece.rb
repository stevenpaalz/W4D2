class Piece
  attr_reader :color, :board, :pos

  def initialize(color = nil, board = nil, pos = nil)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    self.is_a? (NullPiece)
  end
end

module Slideable
  HORIZONTAL_DIRS = [
    [0, -1], #left
    [0, 1], #right
    [-1, 0], #up
    [1, 0], #down
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1], #Up and left
    [1, -1], #Down and left
    [-1, 1], #up and right
    [1, 1], #down and right
  ].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    dirs = self.move_dirs
    result = []
    dirs.each do |dir|
      result += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    result
  end

  private

  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    results = []
    new_pos = self.pos.dup
    new_pos[0] += dx
    new_pos[1] += dy
    while (new_pos[0] >= 0 && new_pos[0] <= 7) && (new_pos[1] >= 0 && new_pos[1] <= 7)
      if @board[new_pos].nil? #call .empty? here
        if @board[new_pos].color == self.color
          results << new_pos
          return results
        end
      else
        results << [new_pos[0], new_pos[1]]
      end
      new_pos[0] += dx
      new_pos[1] += dy
    end
    results
  end
end

module Stepable
  def moves
    diffs = self.move_diffs

    result = []

    diffs.each do |diff|
      new_pos = self.pos.dup
      new_pos[0] += diff[0]
      new_pos[1] += diff[1]
      if (new_pos[0] >= 0 && new_pos[0] <= 7) &&
         (new_pos[1] >= 0 && new_pos[1] <= 7) &&
         (@board[new_pos].nil? ||
          @board[new_pos].color != self.color)
        result << [new_pos[0], new_pos[1]]
      end
    end

    result
  end

  private

  def move_diffs
    raise NotImplementedError
  end
end

# def horizontal_dirs
#     result = []
#     row = self[pos[0]]
#     row.each_with_index do |col, i|
#         if (col == nil && row[i...pos[1]].all? {|ele| ele == nil}) ||
#         (col == nil && row[pos[1]+1..i].all? {|ele| ele == nil})
#             result << [pos[0], i]
# end
