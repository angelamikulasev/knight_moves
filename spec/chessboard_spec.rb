require 'pry'
require 'spec_helper'

describe ::KnightMoves::Chessboard do
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

  describe "#dasherise_moves" do
    context "when one paths exist" do
      it "dasherizes moves" do
        knight_moves = [["a1", "b3", "a5", "c6", "d4"]]

        expect(described_class.dasherise_moves(knight_moves)).to eq(["a1-b3-a5-c6-d4"])
      end
    end

    context "when multiple paths exist" do
      it "dasherizes moves" do
        knight_moves = [["a1", "b3", "a5", "c6", "d4"], ["a1", "b3", "a5", "c6", "d4"]]

        expect(described_class.dasherise_moves(knight_moves)).to eq(
          ["a1-b3-a5-c6-d4", "a1-b3-a5-c6-d4"]
        )
      end
    end
  end
end
