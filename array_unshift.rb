require File.expand_path('../test_helper', __FILE__)

describe "Array's unshift method" do
  it "should put element at beginning of array" do
    a = [1,2,3]
    a.unshift(0).must_equal [0,1,2,3]
  end

  it "should put foo at position 0" do
    a = [:bar, :baz].unshift :foo
    a.unshift :foo
    a[0].must_equal(:foo)
  end

  it "should accept multiple elemets" do
    a = [4,5,6]
    a.unshift(1,2,3).must_equal [1,2,3,4,5,6]
  end
end
