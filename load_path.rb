require "pathname"

filename = __FILE__
pathname = Pathname.new(filename)
p filename
p pathname.dirname
lib = pathname.dirname.join("..", "lib").expand_path
$LOAD_PATH.unshift lib.to_s unless $LOAD_PATH.include?(lib.to_s)
p "load path at position 0: #{$LOAD_PATH[0]}"
