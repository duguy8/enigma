module Generator

  def generate_number
    random_number = Random.new
    @random_key = (random_number.rand(0...99999)).to_s.rjust(5, "0")
  end

  def generate_date
    current_time = Time.now
    current_time.strftime("%m%d%y")
  end

  def generate_offsets(date)
    new = Array.new
    ((date.to_i * date.to_i).to_s[-4..-1]).each_char do |number|
      new.push(number)
    end
    new
  end

  def generate_keys(key, date)
    @a_key = (@offsets[0].to_i + key[0].concat(key[1]).to_i)
    @b_key = (@offsets[1].to_i + key[1].concat(key[2]).to_i)
    @c_key = (@offsets[2].to_i + key[2].concat(key[3]).to_i)
    @d_key = (@offsets[3].to_i + key[3].concat(key[4]).to_i)
  end

  def find_shift(element, key, phrase_index)
    @character_set.find_index(element[phrase_index]) + key
  end

  def find_rshift(element, key, phrase_index)
    @character_set.find_index(element[phrase_index]) - key
  end

  def generate_rotation(key, phrase_index)
    @phrase.each_with_index do |element, index|
      if element[phrase_index] != nil &&
      @character_set.include?(element[phrase_index])
        new = @character_set.rotate(find_shift(element, key, phrase_index))
        @phrase[index][phrase_index].replace(new.first)
      end
    end
  end

  def generate_reversal(key, phrase_index)
    @phrase.each_with_index do |element, index|
      if element[phrase_index] != nil &&
      @character_set.include?(element[phrase_index])
        new = @character_set.rotate(find_rshift(element, key, phrase_index))
        @phrase[index][phrase_index].replace(new.first)
      end
    end
  end
end
