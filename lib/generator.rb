module Generator

  def generate_random_number
    random_number = Random.new
    key = random_number.rand(0...99999)
    key.to_s.rjust(5, "0")
  end

  def generate_date
    current_time = Time.now
    date = current_time.to_s.split[0].scan(/\w/)
    year = date[2].concat(date[3])
    month = date[6].concat(date[7])
    day = date[4].concat(date[5])
    "#{day}#{month}#{year}"
  end
end
