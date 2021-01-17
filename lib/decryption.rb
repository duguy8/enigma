require 'date'
require_relative 'generator'
require_relative 'enigma'

class Decryption 
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
    cleaned_phrase = phrase.delete "\n" "," "!" "&"
    cleaned_phrase.split("").each_slice(4).to_a
  end

  def reversal
    first_reversal.join("").to_s
    second_reversal.join("").to_s
    third_reversal.join("").to_s
    fourth_reversal.join("").to_s
  end

  def first_reversal
    generate_reversal(@a_key, 0)
  end

  def second_reversal
    generate_reversal(@b_key, 1)
  end

  def third_reversal
    generate_reversal(@c_key, 2)
  end

  def fourth_reversal
    generate_reversal(@d_key, 3)
  end
end
