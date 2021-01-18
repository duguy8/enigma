require './test/test_helper'
require './lib/cracking'
require './lib/enigma'

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
    assert_equal (-19), crack.find_crack_shift('h', ' ')
  end

  def test_shifts_can_be_assigned_to_keys
    crack = Cracking.new("hssi", "291018")
    crack.assign_shifts
    assert_equal (-19), crack.d_key
    assert_equal 5, crack.c_key
    assert_equal 32, crack.b_key
    assert_equal 14, crack.a_key
  end

  def test_it_can_rotate_back
    crack = Cracking.new("vjqtbeaweqihssi", "291018")
    expected = "hello world end"
    assert_equal expected, crack.rotate_back
  end
end
