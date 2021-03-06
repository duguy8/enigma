require './test/test_helper'
require './lib/decryption'
require './lib/encryption'
require './lib/enigma'

class EncryptionTest < Minitest::Test
  def test_it_exists
    encryption = Encryption.new("hello world", "02715", "040895")
    assert_instance_of Encryption, encryption
  end

  def test_can_generate_random_number
    encryption = Encryption.new("hello world", "02715", "040895")
    expected = encryption.generate_number
    assert_equal 5, expected.length
    assert_equal String, expected.class
  end

  def test_convert_current_date_to_correct_format
    encryption = Encryption.new("hello world", "02715", "040895")
    assert_equal 6, encryption.generate_date.length
    refute "040895" == encryption.generate_date
  end

  def test_to_generate_offsets
    encryption = Encryption.new("hello world", "02715", "040895")
    expected = ["1", "0", "2", "5"]
    assert_equal expected, encryption.generate_offsets("040895")
  end

  def test_to_generate_keys
    encryption = Encryption.new("hello world", "02715", "040895")
    encryption.generate_keys("02715", "040895")
    assert_equal 3, encryption.a_key
    assert_equal 27, encryption.b_key
    assert_equal 73, encryption.c_key
    assert_equal 20, encryption.d_key
  end

  def test_deconstruct_phrase
    encryption1 = Encryption.new("hello world", "02715", "040895")
    encryption2 = Encryption.new("hello world!", "02715", "040895")
    expected1 = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    expected2 = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"]]
    assert_equal expected1, encryption1.deconstruct("hello world")
    assert_equal expected2, encryption2.deconstruct("hello world!")
  end

  def test_full_rotation
    encryption = Encryption.new("hello world", "02715", "040895")
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, encryption.forward_rotation
  end

  def test_generate_rotation
    encryption = Encryption.new("h", "02715", "040895")
    expected = [["k"]]
    assert_equal expected, encryption.generate_rotation(3, 0)
  end

  def test_rotation_of_hello_world
    encryption = Encryption.new("hello world", "02715", "040895")
    expected = "keder ohulw"
    assert_equal expected, encryption.combine_rotation
  end

  def test_encryption_works_with_enigma
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }
    encryption = enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, encryption
    assert_equal Hash, encryption.class
  end

  def test_encryption_and_decryption
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
