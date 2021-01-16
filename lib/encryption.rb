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
    @phrase = deconstruct(phrase)
    @key = key
    @date = date
    @offsets = generate_offsets(date)
    @keys = generate_keys(key, date)
  end

  def deconstruct(phrase)
    # require "pry"; binding.pry
  end

  def rotate
  end
end
