require 'date'
require './lib/generator'

class Enigma
  include Generator
  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def encrypt(phrase, key, date)
    generate_offsets(date)
    generate_keys(key, date)
    rotate(phrase)
    #calculate_key by taking key and date
    # require "pry"; binding.pry
    #use each with index on phrase
  end

  def generate_offsets(date)
    ((date.to_i * date.to_i).to_s[6..9]).scan(/\w/)
  end

  def generate_keys(key, date)
    @a_key = (generate_offsets(date)[0].to_i + key[0].concat(key[1]).to_i)
    @b_key = (generate_offsets(date)[1].to_i + key[1].concat(key[2]).to_i)
    @c_key = (generate_offsets(date)[2].to_i + key[2].concat(key[3]).to_i)
    @d_key = (generate_offsets(date)[3].to_i + key[3].concat(key[4]).to_i)
  end
end
