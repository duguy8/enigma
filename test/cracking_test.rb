require './test/test_helper'
require './lib/enigma'
require './lib/cracking'

class CrackingTest < Minitest::Test
  def test_it_exists
    crack = Cracking.new("encryption", "010693")
    assert_instance_of Cracking, crack
  end

  def test_can_find_shift
    crack = Cracking.new("hssi", "291018")
    assert_equal 5, crack.find_crack_shift('i', 'd')
    assert_equal 5, crack.find_crack_shift('s', 'n')
    assert_equal 14, crack.find_crack_shift('s', 'e')
    assert_equal -19, crack.find_crack_shift('h', ' ')
  end
end
