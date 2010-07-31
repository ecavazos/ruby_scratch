require 'minitest/spec'
MiniTest::Unit.autorun

describe 'Enumerable' do

  it 'should select items when predicate is true' do
    arr = ['apple', 'orange', 'acorn', 'peach']
    arr.select { |x| x.chr == 'a' }.must_equal ['apple', 'acorn']
  end

  it 'should create a new array after processing each item against a block' do
    arr = [1, 2, 3, 4]
    arr.map { |x| x + x }.must_equal [2, 4, 6, 8]
  end
end
