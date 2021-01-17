require 'date'
require_relative 'generator'
require_relative 'rotation'
require_relative 'decryption'

class Cracking < Decryption
  include Generator
  include Rotation

  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize(phrase, date)
    @character_set = (("a".."z").to_a << " ")
    @phrase = deconstruct(phrase)
    @date = date
    @offsets = generate_offsets(date)
    @cracking_keys = cracking_keys
    # require "pry"; binding.pry
  end

  def cracking_keys
    @a_key = 27
    @b_key = 5
    @c_key = 14
    @d_key = 4
  end

  def rotate_back
    backwards_rotation.join("").to_s
  end
end
