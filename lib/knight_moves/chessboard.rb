require "pry"

module KnightMoves
  module Chessboard
    extend self

    def offsets
      [
        [ 2, -1],
        [ 2,  1],
        [-2,  1],
        [-2, -1],
        [ 1,  2],
        [ 1, -2],
        [-1,  2],
        [-1, -2]
      ]
    end
    def valid_square?(square)
      columns.include?(square[0]) && rows.include?(square[1])
    end

    def rows
      %w[1 2 3 4 5 6 7 8]
    end

    def columns
      %w[a b c d e f g h]
    end
  end
end
