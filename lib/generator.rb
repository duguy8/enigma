module Generator

  def generate_random_number
    random_number = Random.new
    key = random_number.rand(0...99999)
    @random_key = key.to_s.rjust(5, "0")
  end

  def generate_date
    current_time = Time.now
    date = current_time.to_s.split[0].scan(/\w/)
    year = date[2].concat(date[3])
    month = date[6].concat(date[7])
    day = date[4].concat(date[5])
    @current_date = "#{day}#{month}#{year}"
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
end
