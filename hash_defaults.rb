require File.expand_path('../test_helper', __FILE__)

describe 'Hash initialized with block' do

  it 'should add 1 to the key' do
    h = Hash.new do |hash, key|
      hash[key] = key + 1
    end

    h[1]
    h[1].must_equal 2
  end

  it 'should ' do
    h = Hash.new do |hash, key|
      hash[key] = 'default'
    end

    h[:foo]
    h[:foo].must_equal 'default'
  end

end
