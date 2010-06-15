require 'minitest/spec'
MiniTest::Unit.autorun

class Foo
  def test_hash(opts = {})
    opts[:test] || 'blank'
  end
end

describe 'Optional Parameters' do
  it 'should accept hash' do
    Foo.new.test_hash(:test => 'bar').must_equal 'bar'
  end

  it 'should accept no parameters' do
    Foo.new.test_hash.must_equal 'blank'
  end
end
