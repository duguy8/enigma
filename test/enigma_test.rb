require './test/test_helper'
# require 'minitest/autorun'
# require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/encryption'
require './lib/decryption'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_encrypt
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
    assert_equal Hash, enigma.encrypt("hello world", "02715", "040895").class
  end

  def test_enigma_works_with_only_phrase_and_key
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "010101"
               }
    refute expected == enigma.encrypt("hello world", "02715")
    assert_equal 3, enigma.encrypt("hello world", "02715").count
  end

  def test_enigma_can_decrypt
    enigma = Enigma.new
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
               }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_random_number_generation
    # skip
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world")
    enigma.stubs(:encrypt).returns("10101")
    expected = enigma.generate_random_number
    # require "pry"; binding.pry
  end
end
