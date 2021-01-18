require './lib/message'
new = Message.start(File.open(ARGV[0], 'r'))
