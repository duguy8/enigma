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

  def generate_key(date)
    @one = (generate_offsets(date)[0].to_i +
    @a_key[0].to_s.concat(@a_key[1].to_s).to_i)

    @two = (generate_offsets(date)[1].to_i +
    @a_key[1].to_s.concat(@a_key[2].to_s).to_i)

    @three = (generate_offsets(date)[2].to_i +
    @a_key[2].to_s.concat(@a_key[3].to_s).to_i)

    @four = (generate_offsets(date)[3].to_i +
    @a_key[3].to_s.concat(@a_key[4].to_s).to_i)
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
