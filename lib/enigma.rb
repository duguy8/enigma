require 'date'
require './lib/generator'

class Enigma
  include Generator
  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def encrypt(phrase, key, date)
    #calculate_key by taking key and date
    generate_key(key, date)
    # require "pry"; binding.pry
  end

  def generate_offsets(date)
    (date.to_i * date.to_i).to_s[6..9]
  end

  def generate_keys(key, date)
    # @a = (key[0..1] + date[])
  end
end
