module Generator

  def generate_random_number
    random_number = Random.new
    key = random_number.rand(0...99999)
    @random_key = key.to_s.rjust(5, "0")
  end

  def generate_date
    current_time = Time.now
    current_time.strftime("%m%d%y")
  end

  def generate_offsets(date)
    ((date.to_i * date.to_i).to_s[6..9]).scan(/\w/)
  end

  def generate_keys(key, date)
    @a_key = (generate_offsets(date)[0].to_i + key[0].concat(key[1]).to_i)
    @b_key = (generate_offsets(date)[1].to_i + key[1].concat(key[2]).to_i)
    @c_key = (generate_offsets(date)[2].to_i + key[2].concat(key[3]).to_i)
    @d_key = (generate_offsets(date)[3].to_i + key[3].concat(key[4]).to_i)
  end

  def generate_rotation(key, phrase_index)
    # @phrase.each_with_index do |element, index|
    #   if element[phrase_index] != nil
    #     new_index = @character_set.find_index(element[phrase_index]) + key
    #     if new_index > 27
    #       adjusted_index = (new_index % @character_set.length)
    #       element[phrase_index].replace(@character_set[adjusted_index])
    #     else
    #       element[phrase_index].replace(@character_set[new_index])
    #     end
    #   end
    # end
  end

  def find_rshift(element, key, phrase_index)
    @character_set.find_index(element[phrase_index]) - key
  end

  def generate_reversal(key, phrase_index)
    @phrase.each_with_index do |element, index|
      if element[phrase_index] != nil
        new = @character_set.rotate(find_rshift(element, key, phrase_index))
        @phrase[index][phrase_index].replace(new.first)
      end
    end
  end
end
