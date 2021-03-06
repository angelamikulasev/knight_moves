require 'pry'
require 'spec_helper'

describe ::KnightMoves::Chessboard do
  describe "#calculate_moves" do
    context "when current_square is equal to destination_square" do
      it "returns visited_squares" do
        expect(
          described_class.calculate_moves("d4", "d4", ["a1", "c2", "b4", "c6", "d4"])
        ).to eq(["a1", "c2", "b4", "c6", "d4"])
      end
    end

    context "when there is no path within four squares" do
      it "returns an empty array" do
        expect(described_class.calculate_moves("a1", "h5", ["a1", "b3", "c5", "e6", "f4", "h5"])).to eq(nil)
      end
    end

    context "when data is incorrect" do
      it "returns an error message" do
        expect(described_class.calculate_moves("z1", "a2", [])).to eq("invalid square: z1")
      end
    end

    context "when data is correct" do
      it "returns no error message" do
        expect(described_class.calculate_moves("a1", "c2", [])).to_not eq("a1 and/or c2 are invalid.")
      end

      it "lists each square the knight travels" do
        expect(described_class.calculate_moves("a1", "d4", [])).to eq(sorted_knight_moves)
      end
    end
  end

  describe "#calculate_next_moves" do
    context "when current square is on the board edge" do
      it "lists all valid potential moves" do
        expect(described_class.calculate_next_moves("a1")).to eq(["c2", "b3"])
      end

      it "excludes all invalid moves" do
        expect(described_class.calculate_next_moves("a1")).to_not eq(
          ["c0", "c2", "_2", "_0", "b3", "b/", "`3", "`/"]
        )
      end
    end

    context "when current square is not on the board edge" do
      it "lists all valid potential moves" do
        expect(described_class.calculate_next_moves("d4")).to eq(
          ["f3", "f5", "b5", "b3", "e6", "e2", "c6", "c2"]
        )
      end
    end
  end

  describe "#offset_square" do
    it "calculates one offset based on the position of the current square" do
      expect(described_class.offset_square("b4", [-1,  2])).to eq("a6")
    end
  end

  describe "#valid_square?" do
    context "when a square contains a valid row and column" do
      it "returns true" do
        expect(described_class.valid_square?("c6")).to eq(true)
      end
    end

    context "when a square contains an invalid row and column" do
      it "returns false" do
        expect(described_class.valid_square?("m10")).to eq(false)
      end
    end

    context "when a square contains an invalid row and valid column" do
      it "returns false" do
        expect(described_class.valid_square?("m4")).to eq(false)
      end
    end

    context "when a square contains a valid row and and invalid column" do
      it "returns false" do
        expect(described_class.valid_square?("`9")).to eq(false)
      end
    end
  end

  describe "#dasherize_moves" do
    it "dasherizes the kinghts path from start_square to destination_square" do
      expect(described_class.dasherize_moves(sorted_knight_moves)).to eq(
        [
          "a1-b3-a5-c6-d4",
          "a1-b3-c1-e2-d4",
          "a1-b3-c5-e6-d4",
          "a1-b3-d2-f3-d4",
          "a1-b3-d2-f3-d4",
          "a1-b3-d4",
          "a1-c2-a3-b5-d4",
          "a1-c2-b4-c6-d4",
          "a1-c2-d4",
          "a1-c2-e1-f3-d4",
          "a1-c2-e3-f5-d4"
        ]
      )
    end
  end

  describe "#sort_paths_alphabetically" do
    it "sorts an array of paths alphabetically" do
      expect(described_class.sort_paths_alphabetically(unsorted_knight_moves)).to eq(sorted_knight_moves)
    end
  end
end
