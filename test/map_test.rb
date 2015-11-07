require 'minitest/autorun'
require './lib/map.rb'
require './lib/point.rb'

describe Map do
  before do
    @subject = Map.new(Point.new(5, 5))
  end

  it 'knows if a point is in/out of bounds' do
    @subject.valid_position?(Point.new(0, 5)).must_equal(true)
    @subject.valid_position?(Point.new(-1, 5)).must_equal(false)
    @subject.valid_position?(Point.new(3, 6)).must_equal(false)
  end
end
