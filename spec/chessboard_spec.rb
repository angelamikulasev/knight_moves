require 'pry'
require 'spec_helper'

describe ::KnightMoves::Chessboard do
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
end