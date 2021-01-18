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
    @help = [' ', 'e', 'n', 'd']
  end

  def rotate_back
    # @phrase.each_with_index do |element, index|
    #   require "pry"; binding.pry
    # end
    # # crack_rotation
  end

  def assign_shifts(phrase)

  end

  def find_crack_shift(element, hint)
    new = @character_set.find_index(element)
    new - @character_set.find_index(hint)
  end

  # def cracking_keys
  #   @character_set.rotate(find_crack_shift(@phrase.flatten.last[-1], 'd'))
  #   @character_set.rotate(find_crack_shift(@phrase.flatten.last[-2], 'n'))
  #   @character_set.rotate(find_crack_shift(@phrase.flatten.last[-3], 'e'))
  #   @character_set.rotate(find_crack_shift(@phrase.flatten.last[-4], ' '))
  # end
end
