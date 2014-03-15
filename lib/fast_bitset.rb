require "fast_bitset/version"

module FastBitset

  def self.pure_bitstring_to_ids(value)
    unless value.is_a?(String)
      raise TypeError.new("wrong argument type #{value.class} (expected String)")
    end
    offset = 0
    ids    = []
    return ids if value.nil?
    value.each_byte do |byte|
      7.downto(0) do |i|
        value = (1<<i)
        ids << offset if (value & byte) == value
        offset += 1
      end
    end
    ids
  end

  begin
    # Load the native version.
    require 'fast_bitset/fast_bitset'
    class << self
      alias bitstring_to_ids native_bitstring_to_ids
    end
  rescue LoadError
    class << self
      alias bitstring_to_ids pure_bitstring_to_ids
    end
  end

end
