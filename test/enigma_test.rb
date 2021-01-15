require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_encrypt_message
    skip
    enigma = Enigma.new
    enigma.stubs(:encrypt).returns({
                                    encryption: "Foo Bar",
                                    key: "11111",
                                    date: "011521"
                                  })

  end
end
