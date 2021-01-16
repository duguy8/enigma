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
    phrase.split("").each_slice(4).to_a
  end

  def rotate
    first_rotation
    second_rotation
    third_rotation
    fourth_rotation.join("").to_s
  end

  def first_rotation
    @phrase.each_with_index do |element, index|
      new_index = @character_set.find_index(element[0]) + @a_key
      if new_index > 27
        adjusted_index = (new_index % @character_set.length)
        element[0].replace(@character_set[adjusted_index])
      else
      element[0].replace(@character_set[new_index])
      end
    end
  end

  def second_rotation
    @phrase.each_with_index do |element, index|
      if element.length >= 2
        new_index = @character_set.find_index(element[1]) + @b_key
        if new_index > 27
          adjusted_index = (new_index % @character_set.length)
          element[1].replace(@character_set[adjusted_index])
        else
          element[1].replace(@character_set[new_index])
        end
      end
    end
  end

  def third_rotation
    @phrase.each_with_index do |element, index|
      if element.length >= 3
        new_index = @character_set.find_index(element[2]) + @c_key
        if new_index > 27
          adjusted_index = (new_index % @character_set.length)
          element[2].replace(@character_set[adjusted_index])
        else
          element[2].replace(@character_set[new_index])
        end
      end
    end
  end

  def fourth_rotation
    @phrase.each_with_index do |element, index|
      if element.length == 4
        new_index = @character_set.find_index(element[3]) + @d_key
        if new_index > 27
          adjusted_index = (new_index % @character_set.length)
          element[3].replace(@character_set[adjusted_index])
        else
          element[3].replace(@character_set[new_index])
        end
      end
    end
  end
end
