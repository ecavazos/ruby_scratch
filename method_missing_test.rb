require 'minitest/spec'
MiniTest::Unit.autorun

class Missing

  def method_missing_hook; end

  def method_missing(method_name, *args, &block)
    method_name = method_name.to_s

    if self.class.private_method_defined?(method_name)
      return "#{method_name}() is a private method!"
    end

    # define method
    self.class.class_eval do
      define_method(method_name) do |msg|
        "Hello #{msg}"
      end
    end

    method_missing_hook

    # call new method
    self.send(method_name, *args, &block)

  end

  private
  def password
  end
end

describe 'Method missing' do
  before do
    @mm = Missing.new
  end

  it 'should not allow private methods to be called' do
    expected = 'password() is a private method!'
    @mm.password.must_equal expected
  end

  it 'should define and call the method when the method is missing' do
    @mm.hello('sexy!').must_equal 'Hello sexy!'
  end

  it 'should only define method once' do
    @mm.instance_eval do
      def method_missing_hook
        @called ||= 0
        @called += 1
      end
    end

    @mm.hi('poop')
    @mm.hi('poop')

    @mm.instance_eval { @called.must_equal 1 }
  end
end
