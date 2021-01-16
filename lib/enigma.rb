require 'date'
require_relative 'generator'

class Enigma
include Generator

  def initialize
    @random_key = generate_random_number
    @current_date = generate_date
  end

  def encrypt(phrase, key = @random_key, date = @current_date)
    original = Encryption.new(phrase, key, date)
    encrypted = original.rotate
    # encrypted = to_encrypt.rotate
    # encrypted
    #calculate_key by taking key and date
    #use each with index on phrase
    # @phrase.join("").to_s
  end
end
