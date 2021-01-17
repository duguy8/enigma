require './lib/enigma'
require './lib/encryption'

file = File.open(ARGV[0], 'r')

incoming = file.read

to_encrypt = incoming.to_s.downcase

enigma = Enigma.new

encrypted = enigma.encrypt(to_encrypt)

file.close

writer = File.open(ARGV[1], 'w')

name = ARGV[1].to_s

writer.write(encrypted[:encryption])

puts "Created '#{name}' with the key #{encrypted[:key]} and the date #{encrypted[:date]}"

writer.close
