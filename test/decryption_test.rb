require './test/test_helper'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma'

class DecryptionTest < Minitest::Test
  def test_it_exists
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_instance_of Decryption, decrypt
  end

  def test_decrypt_can_generate_random_number
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = decrypt.generate_number
    assert_equal 5, expected.length
    assert_equal String, expected.class
  end

  def test_it_can_generate_offsets
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = ["1", "0", "2", "5"]
    assert_equal expected, decrypt.generate_offsets("040895")
  end

  def test_date_conversion
    decrypt = Decryption.new("keder ohulw", "02715", "010693")
    assert_equal 6, decrypt.generate_date.length
    refute "010693" == decrypt.generate_date
  end

  def test_it_can_deconstruct_a_phrase
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, decrypt.deconstruct("keder ohulw")
  end

  def test_find_rshift
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_equal (-23), decrypt.find_rshift(["k", "e", "d", "e"], 27, 1)
  end

  def test_convert_keys
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_instance_of Hash, decrypt.convert_keys
  end

  def test_backwards_rotation
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal expected, decrypt.backwards_rotation
  end

  def test_reversal
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = "hello world"
    assert_equal expected, decrypt.combine_reversal
  end

  def test_decyption_works_with_enigma
    enigma = Enigma.new
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
               }
    decryption = enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected, decryption
    assert_equal Hash, decryption.class
  end

  def test_decryption_with_encryption
    enigma = Enigma.new
    expected1 = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    expected2 = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }
    assert_equal expected1, enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected2, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
