require 'test/unit'

class Foo
  def initialize
    @bar = 'bar'
  end

  def get_bar
    @bar
  end

  def set_bar(val)
    @bar = val
  end
end

class FooTest < Test::Unit::TestCase
  test 'bar should not be accessible outside of Foo' do
    foo = Foo.new
    assert_raise NoMethodError do
      foo.bar
    end
  end

  test 'bar should be available inside of Foo' do
    foo = Foo.new
    assert_equal 'bar', foo.get_bar
  end

  test 'bar should not be shared across instances' do
    foo1 = Foo.new
    foo2 = Foo.new
    
    foo1.set_bar('baz')
    assert_equal 'baz', foo1.get_bar
    assert_equal 'bar', foo2.get_bar
  end
end
