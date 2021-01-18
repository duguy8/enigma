require './test/test_helper'
require './lib/enigma'
require './lib/cracking'

class CrackingTest < Minitest::Test
  def test_it_exists
    crack = Cracking.new("encryption", "010693")
    assert_instance_of Cracking, crack
  end

  def test_crack_can_rotate_back
    crack = Cracking.new("vjqtbeaweqihssi", "291018")
    assert_equal "hello world end", crack.rotate_back
  end
end
