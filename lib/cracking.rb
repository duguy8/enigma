require 'date'
require_relative 'generator'
require_relative 'rotation'

class Cracking
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

  def deconstruct(phrase)
    phrase.downcase.split('').each_slice(4).to_a
  end

  def rotate_back
    assign_shifts
    backwards_rotation.join("").to_s
  end

  def assign_shifts
    @d_key = find_crack_shift(@phrase.flatten[-4], @help[-4])
    @c_key = find_crack_shift(@phrase.flatten[-1], @help[-1])
    @b_key = (find_crack_shift(@phrase.flatten[-2], @help[-2])) +
    @character_set.length
    @a_key = find_crack_shift(@phrase.flatten[-3], @help[-3])
  end

  def find_crack_shift(element, hint)
    new = @character_set.find_index(element)
    new - @character_set.find_index(hint)
  end
end
