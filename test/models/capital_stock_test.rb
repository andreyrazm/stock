require 'test_helper'

class CapitalStockTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:price)
  should validate_presence_of(:quantity)
  should validate_presence_of(:percentage)
  should validate_presence_of(:years)
  should validate_numericality_of(:price)
  should validate_numericality_of(:quantity)
  should validate_numericality_of(:percentage)
  should validate_numericality_of(:years)
  should_not allow_value(-1).for(:price)
  should_not allow_value(-1).for(:quantity)
  should_not allow_value(-1).for(:percentage)
  should_not allow_value(-1).for(:years)
end
