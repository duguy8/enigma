module Rotation

  def first_rotation
    generate_rotation(@a_key, 0)
  end

  def second_rotation
    generate_rotation(@b_key, 1)
  end

  def third_rotation
    generate_rotation(@c_key, 2)
  end

  def fourth_rotation
    generate_rotation(@d_key, 3)
  end

  def first_reversal
    generate_reversal(@a_key, 0)
  end

  def second_reversal
    generate_reversal(@b_key, 1)
  end

  def third_reversal
    generate_reversal(@c_key, 2)
  end

  def fourth_reversal
    generate_reversal(@d_key, 3)
  end
end
