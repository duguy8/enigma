require 'date'
require_relative 'generator'

class Enigma
  include Generator

  def encrypt(phrase, key = generate_number, date = generate_date)
    original = Encryption.new(phrase, key, date)
    {
      encryption: original.combine_rotation,
      key: key,
      date: date
    }
  end

  def decrypt(phrase, key = generate_number, date = generate_date)
    original = Decryption.new(phrase, key, date)
    {
      decryption: original.combine_reversal,
      key: key,
      date: date
    }
  end
end
