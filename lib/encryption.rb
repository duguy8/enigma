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
    phrase.split("")
  end

  def rotate
    first_rotation
    second_roation
    # third_rotation
    # fourth_rotation.join("").to_s
  end

  def first_rotation
    new_phrase = @phrase.each_with_index do |element, index|
      if index == 0 || index % 4 == 0
        new_index = @character_set.find_index(element) + @a_key
        element.replace(@character_set[new_index])
        end
      end
    end
end
