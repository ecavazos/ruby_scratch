require File.expand_path('../test_helper', __FILE__)

describe 'Optional Parameters' do

  before do
    class Foo
      def opt_hash(opts = {})
        opts[:test] || 'blank'
      end

      def two_params(a, b = 'b')
        [a, b]
      end
    end

    @foo = Foo.new
  end

  it 'should accept hash' do
    @foo.opt_hash(:test => 'bar').must_equal 'bar'
  end

  it 'should accept no parameters' do
    @foo.opt_hash.must_equal 'blank'
  end

  it 'should accept one parameter' do
    @foo.two_params('a').must_equal ['a', 'b']
  end

  it 'should throw argument error when no parameters are giving' do
    proc { @foo.two_params }.must_raise ArgumentError
  end
end

