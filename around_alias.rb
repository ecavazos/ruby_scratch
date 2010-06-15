class Greeter
  def greet
    puts "Hello!"
  end
end

Greeter.new.greet

class Greeter  
  alias_method :greet_without_log, :greet
end

Greeter.new.greet
Greeter.new.greet_without_log

class Greeter
  def greet_with_log
    puts "\ncalling method..."
    greet_without_log
    puts "...method called\n\n"
  end
  
  alias_method :greet, :greet_with_log
end

Greeter.new.greet
p Greeter.new.methods.grep(/^greet/)