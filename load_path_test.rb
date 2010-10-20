require File.expand_path('../test_helper', __FILE__)
require 'pathname'

describe 'Load path stuff' do

  before do
    @path = File.expand_path('../', __FILE__)
    $LOAD_PATH.delete(@path)
  end

  it 'should haz alias' do
    $LOAD_PATH.must_equal $:
  end

  it 'should return file name' do
    __FILE__.must_equal 'load_path_test.rb'
  end

  it 'should not contain path' do
    $LOAD_PATH.include?(@path).must_equal false
  end

  it 'should contain path' do
    $LOAD_PATH.unshift @path
    $LOAD_PATH.include?(@path).must_equal true
  end

  it 'should add the same path twice' do
    # warning: this is not something you want to do
    $LOAD_PATH.unshift @path
    $LOAD_PATH.unshift @path
    $LOAD_PATH[0].must_equal @path
    $LOAD_PATH[1].must_equal @path
  end
end
