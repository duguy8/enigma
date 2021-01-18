require_relative 'message'
Message.start(File.open(ARGV[0], 'r'))
