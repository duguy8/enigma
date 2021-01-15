require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_generate_key
    skip
    enigma = Enigma.new
    enigma.stubs(:encrypt).returns({
                                    encryption: "Foo Bar",
                                    key: "01592",
                                    date: "011521"
                                  })
    assert_equal "01592", enigma.generate_key
  end

  def test_enigma_can_find_todays_date
    skip
    enigma = Enigma.new
    enigma.stubs(:encrypt).returns({
                                    encryption: "Foo Bar",
                                    key: "01592",
                                    date: "011521"
                                  })
    assert_equal "01592", enigma.generate_key
  end

  def test_enigma_can_encrypt_message
    skip
    enigma = Enigma.new
    enigma.encrypt({
                    encryption: "Foo Bar",
                    key: "11111",
                    date: "011521"
                  })
    assert_equal "Foo Bar"
  end
end
