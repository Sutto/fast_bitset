require 'fast_bitset'
require 'benchmark'

test_100 = "d" * 100
test_1000 = "d" * 1000
test_100000 = "d" * 100000
test_1000000 = "d" * 1000000

Benchmark.bm do |b|
  b.report "native - 100" do
    1000.times { FastBitset.native_bitstring_to_ids test_100 }
  end

  b.report "pure ruby - 100" do
    1000.times { FastBitset.pure_bitstring_to_ids test_100 }
  end

  b.report "native - 1000" do
    1000.times { FastBitset.native_bitstring_to_ids test_1000 }
  end

  b.report "pure ruby - 1000" do
    1000.times { FastBitset.pure_bitstring_to_ids test_1000 }
  end

  b.report "native - 100000" do
    1000.times { FastBitset.native_bitstring_to_ids test_100000 }
  end

  # b.report "pure ruby - 100000" do
  # end

  # b.report "native - 1000000" do
  # end

  # b.report "pure ruby - 1000000" do
  # end
end