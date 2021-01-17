require 'date'
require_relative 'generator'
require_relative 'enigma'

class Encryption < Enigma
include Generator

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
    cleaned_phrase = phrase.delete("\n")
    cleaned_phrase.split("").each_slice(4).to_a
  end

  def rotate
    first_rotation.join("").to_s
    second_rotation.join("").to_s
    third_rotation.join("").to_s
    fourth_rotation.join("").to_s
  end

  def first_rotation
    generate_rotation(@a_key, 0)
  end

  def second_rotation
    generate_rotation(@b_key, 1)
  end

  def third_rotation
    generate_rotation(@c_key, 2)
  end

  def fourth_rotation
    generate_rotation(@d_key, 3)
  end
end
