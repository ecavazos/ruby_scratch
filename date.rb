require 'minitest/spec'
require 'date'

MiniTest::Unit.autorun

describe 'Date' do
  it 'should format date (yyyymmdd)' do
    Date.new(2010, 06, 14).strftime('%Y%m%d').must_equal '20100614'
  end

  it 'should format date and time (yyyymmddhhmmss)' do
    DateTime.new(2010, 06, 14, 15, 16, 17)
      .strftime('%Y%m%d%H%M%S').must_equal '20100614151617'
  end
end
