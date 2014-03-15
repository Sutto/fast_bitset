require 'rspec'
require 'fast_bitset'

describe FastBitset do

  shared_examples_for 'a bit set implementation' do

    it 'raises an error with a non string' do
      expect { convert(0) }.to raise_error TypeError
      expect { convert(nil) }.to raise_error TypeError
    end

    it 'works with empty strings' do
      expect(convert("")).to eq []
    end

    it 'works with trivial cases' do
      expect(convert(0b11111111.chr)).to eq [0, 1, 2, 3, 4, 5, 6, 7]
      expect(convert(0b00000000.chr)).to eq []
      expect(convert(0b11111110.chr)).to eq [0, 1, 2, 3, 4, 5, 6]
      expect(convert(0b11100000.chr)).to eq [0, 1, 2]
      expect(convert(0b10000001.chr)).to eq [0, 7]
      expect(convert(0b01011011.chr)).to eq [1, 3, 4, 6, 7]
    end

    it 'works with complex cases' do
      expect(convert("\x0F\x0F")).to eq [4, 5, 6, 7, 12, 13, 14, 15]
      expect(convert("\x00\x00")).to eq []
      expect(convert("\x00\x0F")).to eq (12..15).to_a
      expect(convert("\x00\x01")).to eq [15]
      expect(convert("\xFF\xFF")).to eq (0..15).to_a
    end

    it 'works with amusing emoji' do
      # Test Data courtesy @mattallen
      expect(convert("💩")).to eq [0, 1, 2, 3, 8, 11, 12, 13, 14, 15, 16, 19, 22, 24, 26, 28, 31]
    end

  end

  describe '.native_bitstring_to_ids' do
    def convert(value); FastBitset.native_bitstring_to_ids(value); end
    it_behaves_like 'a bit set implementation'
  end

  describe '.pure_bitstring_to_ids' do
    def convert(value); FastBitset.pure_bitstring_to_ids(value); end
    it_behaves_like 'a bit set implementation'
  end

end