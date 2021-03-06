require File.expand_path('../test_helper', __FILE__)

describe 'Seconds' do

  it 'should convert seconds to minutes' do
    seconds = 240
    (seconds/60).must_equal 4
  end

  it 'should convert whole minutes only' do
    seconds = 119
    (seconds/60).to_i.must_equal 1
  end

  it 'should give seconds remaining after extracting the minutes' do
    seconds = 119
    (seconds%60).to_i.must_equal 59
  end

  it 'should convert minutes to hours' do
    minutes = 61
    (minutes/60).to_i.must_equal 1
  end

  it 'should give minutes remaining after extracting the hours' do
    minutes = 66
    (minutes%60).to_i.must_equal 6
  end
end
