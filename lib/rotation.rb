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
    new = []
    convert_keys.each do |key, index|
      new = generate_rotation(key, index)
    end
    new
  end

  def backwards_rotation
    new = []
    convert_keys.each do |key, index|
      new = generate_reversal(key, index)
    end
    new
  end
end
