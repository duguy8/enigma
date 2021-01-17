require './lib/enigma'
require './lib/decryption'

message = File.open(ARGV[0], 'r')

incoming = message.read

phrase = incoming.to_s.downcase

enigma = Enigma.new

key = ARGV[2]

date = ARGV[3]

decrypted = enigma.decrypt(phrase, key, date)

message.close

writer = File.open(ARGV[1], 'w')

name = ARGV[1].to_s

writer.write(decrypted[:decryption])

puts "Created '#{name}' with the key #{decrypted[:key]} and the date #{decrypted[:date]}"

writer.close
