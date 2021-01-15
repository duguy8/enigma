require 'date'

class Enigma

  def encrypt(phrase)

  end

  def generate_key
    random_number = Random.new
    key = random_number.rand(0...99999)
    key.to_s.rjust(5, "0")
  end
end
