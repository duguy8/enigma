require 'date'
require_relative 'generator'
require_relative 'rotation'

class Encryption
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
    phrase.downcase.split('').each_slice(4).to_a
  end

  def combine_rotation
    forward_rotation.join("").to_s
  end
end
