require 'minitest/spec'
MiniTest::Unit.autorun

class Greeter
  def greet
    'Hello!'
  end
end

describe 'Around alias' do

  it 'should be able to call original greet method' do
    Greeter.new.greet.must_equal 'Hello!'
  end

  it 'should alias method' do
    class Greeter
      alias_method :greet_alias, :greet
    end
    Greeter.new.greet_alias.must_equal 'Hello!'
  end

  it 'should alias original greet method with a new method with logging behavior (around alias)' do
    class Greeter
      def greet_with_log
        s = greet_alias
        s + ' (was logged)'
      end

      alias_method :greet_alias, :greet
      alias_method :greet, :greet_with_log
    end

    greeter = Greeter.new
    greeter.greet.must_equal 'Hello! (was logged)'
    greeter.methods.grep(/^greet/).size.must_equal 3
  end
end
