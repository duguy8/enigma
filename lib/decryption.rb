require 'date'
require_relative 'generator'
require_relative 'rotation'

class Decryption
include Generator
include Rotation

  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize(phrase, key, date)
    @character_set = (("a".."z").to_a << " ")
    @phrase = deconstruct(phrase)
    @key = key
    @date = date
    @offsets = generate_offsets(date)
    @keys = generate_keys(key, date)
  end

  def deconstruct(phrase)
    cleaned_phrase = phrase.delete "\n" "," "!" "&" "'" "-"
    cleaned_phrase.split("").each_slice(4).to_a
  end

  def reversal
    backwards_rotation.join("").to_s
  end
end
