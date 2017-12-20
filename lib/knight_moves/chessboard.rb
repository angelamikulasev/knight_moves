require "pry"

module KnightMoves
  module Chessboard
    extend self

    def calculate_next_moves(square)
      offsets
        .map { |offset| offset_square(square, offset) }
        .select { |square| valid_square?(square) }
    end

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

    def offset_square(square, offset)
      ("#{(square[0].ord + offset[0]).chr}#{(square[1].ord + offset[1]).chr}")
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

    def dasherise_moves(knight_moves)
      knight_moves.map do |move|
        move.join("-")
      end
    end
  end
end
