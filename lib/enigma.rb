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
    encrypted = {
                  encryption: original.rotate,
                  key: key,
                  date: date
                }
  end
end
