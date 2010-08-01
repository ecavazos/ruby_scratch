require 'minitest/spec'
require File.expand_path('../test_helper', __FILE__)

MiniTest::Unit.autorun

clean(:foo)

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

describe 'Class variables' do

  it 'should not allow access to @bar directly' do
    foo = Foo.new
    proc { foo.bar }.must_raise NoMethodError
  end

  it 'should allow access to @bar from inside Foo' do
    foo = Foo.new
    assert_equal 'bar', foo.get_bar
  end

  it 'should not share @bar across instances' do
    foo1 = Foo.new
    foo2 = Foo.new

    foo1.set_bar('baz')
    assert_equal 'baz', foo1.get_bar
    assert_equal 'bar', foo2.get_bar
  end
end
