require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_generate_random_number
    enigma = Enigma.new
    expected = enigma.generate_random_number
    assert_equal 5, expected.length
    assert_equal String, expected.class
  end

  def test_convert_current_date_to_correct_format
    enigma = Enigma.new
    assert_equal "011521", enigma.generate_date
  end

  def test_to_generate_offsets
    enigma = Enigma.new
    assert_equal "1025", enigma.generate_offsets("040895")
  end

  def test_to_generate_keys
    enigma = Enigma.new
    enigma.generate_keys("02715", "1025")
    assert_equal 3, enigma.a_key
    assert_equal 27, enigma.a_key
    assert_equal 73, enigma.a_key
    assert_equal 20, enigma.a_key
  end

  def test_enigma_can_encrypt
    skip
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end
end
