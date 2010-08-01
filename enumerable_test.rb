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

  it 'should map first and last names to full names' do
    names = [
      { :first => 'Bruce',  :last => 'Smith' },
      { :first => 'Bill',   :last => 'Clinton' },
      { :first => 'Kanye',  :last => 'West' },
      { :first => 'George', :last => 'Lopez' },
    ]

    full = names.map do |x|
      "#{x[:first]} #{x[:last]}"
    end

    full.must_equal ['Bruce Smith', 'Bill Clinton', 'Kanye West', 'George Lopez']
  end

  it 'should be false when no matches are found' do
    arr = ['cat', 'dog', 'mouse']
    arr.any? { |x| x == 'bird' }.must_equal false
  end

  it 'should be false when object is not included' do
    o1 = Object.new
    o2 = Object.new
    [o1].include?(o2).must_equal false
  end
end
