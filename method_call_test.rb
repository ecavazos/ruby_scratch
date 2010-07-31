require 'minitest/spec'

MiniTest::Unit.autorun

module Trash
  def momma(insult)
    "momma is so #{insult}"
  end
end

module Talk
  include Trash

  def say_hi(method)
    'hello ' + send(method)
  end

  def world
    'world'
  end

  def your(trash, insult)
    'your ' + send(trash, insult)
  end
end

class Foo; end

describe 'Method call with send' do
  before do
    @foo = Foo.new
    @foo.instance_eval { extend Talk }
  end

  it 'should accept symbol' do
    @foo.say_hi(:world).must_equal 'hello world'
  end

  it 'should accept string' do
    @foo.say_hi('world').must_equal 'hello world'
  end

  it 'should accept parameters' do
    @foo.your(:momma, 'fat').must_equal 'your momma is so fat'
  end
end
