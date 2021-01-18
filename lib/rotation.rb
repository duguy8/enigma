module Rotation

  def convert_keys
    {
      @a_key => 0,
      @b_key => 1,
      @c_key => 2,
      @d_key => 3
    }
  end

  def forward_rotation
    convert_keys.reduce([]) do |acc, (key, index)|
      acc = generate_rotation(key, index)
      acc
    end
  end

  def backwards_rotation
    convert_keys.reduce([]) do |acc, (key, index)|
      acc = generate_reversal(key, index)
      acc
    end
  end
end
