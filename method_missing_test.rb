class Foo
  def method_missing(method_name, *args, &block)
    method_name = method_name.to_s

    if self.class.private_method_defined?(method_name)
      return puts "#{method_name}() is private, hands off!"
    end

    # define method
    puts "define method #{method_name}()"
    self.class.class_eval do
      define_method(method_name) do |msg|
        puts "Hello #{msg}"
      end
    end

    # call new method
    self.send(method_name, *args, &block)

  end

  private
  def secret
  end
end

foo = Foo.new
foo.secret
foo.hi "world"
foo.hi "to you"
