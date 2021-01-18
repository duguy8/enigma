require 'date'
require_relative 'generator'

class Enigma
  include Generator

  def encrypt(phrase, key = generate_number, date = generate_date)
    original = Encryption.new(phrase, key, date)
    {
      encryption: original.rotate,
      key: key,
      date: date
    }
  end

  def decrypt(phrase, key = generate_number, date = generate_date)
    original = Decryption.new(phrase, key, date)
    {
      decryption: original.reversal,
      key: key,
      date: date
    }
  end

  # def crack(phrase, date = generate_date)
  #   original = Cracking.new(phrase, date)
  #   {
  #     decryption: original.rotate_back,
  #     date: date,
  #     key: "key"
  #   }
  # end
end
