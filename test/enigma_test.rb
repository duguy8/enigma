require './test/test_helper'
require 'mocha/minitest'
require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
require './lib/cracking'

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

  def test_encryption_with_todays_date
    enigma = Enigma.new
    enigma.stubs(:generate_date).returns("010121")
    expected = enigma.encrypt("hello world", "02715")
    assert_equal "010121", expected[:date]
  end

  def test_decryption_with_todays_date
    enigma1 = Enigma.new
    enigma2 = Enigma.new
    enigma2.stubs(:generate_date).returns("090909")
    encrypted = enigma1.encrypt("hello world", "02715", "040895")
    expected = enigma2.decrypt(encrypted[:encryption], "02715")
    assert_equal "090909", expected[:date]
  end

  def test_encryption_with_only_date
    enigma = Enigma.new
    enigma.stubs(:generate_date).returns("010693")
    enigma.stubs(:generate_number).returns("10101")
    expected = enigma.encrypt("hello world")
    assert_equal "010693", expected[:date]
    assert_equal "10101", expected[:key]
    assert_equal Hash, expected.class
  end

  def test_encryption_with_another_key
    enigma = Enigma.new
    expected = {
                encryption: "vjqtbeaweqihssi",
                key: "08304",
                date: "291018"
               }
    assert_equal expected, enigma.encrypt("hello world end", "08304", "291018")
  end

  def test_encryption_with_special_characters
    enigma = Enigma.new
    expected = {
      encryption: "keder-ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello-world", "02715", "040895")
  end

  def test_decryption_with_special_characters
    enigma = Enigma.new
    expected = {
      decryption: "hello-world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder-ohulw!", "02715", "040895")
  end

  def test_encryption_with_all_upcase
    enigma = Enigma.new
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("HELLO WORLD", "02715", "040895")
  end
end
