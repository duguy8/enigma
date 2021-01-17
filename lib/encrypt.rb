require './lib/enigma'
require './lib/encryption'

message = File.open(ARGV[0], 'r')

phrase = (message.read).to_s.downcase

enigma = Enigma.new

encrypted = enigma.encrypt(phrase)

message.close

writer = File.open(ARGV[1], 'w')

name = ARGV[1].to_s

writer.write(encrypted[:encryption])

puts "Created '#{name}' with the key #{encrypted[:key]} and the date #{encrypted[:date]}"

writer.close
