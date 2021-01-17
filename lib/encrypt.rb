#needs two command line arguments
#1 existing file that contains a message to encrypt
#2 file where the program should write encrypted message to

#program should output to the screen file it wrote to, key & date
require_relative 'enigma'
require_relative 'encryption'

file = File.open(ARGV[0], 'r')

incoming = file.read

puts incoming

file.close
