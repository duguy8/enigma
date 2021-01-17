require './test/test_helper'
require './lib/enigma'
require './lib/cracking'

class CrackingTest < Minitest::Test
  def test_it_exists
    crack = Cracking.new("encryption", "010693")
    assert_instance_of Cracking, crack
  end
end
