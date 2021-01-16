# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def test_it_exists
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_instance_of Decryption, decrypt
  end

  def test_it_can_deconstruct_a_phrase
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, decrypt.deconstruct("keder ohulw")
  end
end
