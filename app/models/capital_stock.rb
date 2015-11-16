class CapitalStock < ActiveRecord::Base
  before_save :calculate_shares

  validates_presence_of :name, :price, :quantity, :percentage, :years
  validates_numericality_of :price, :quantity, :percentage, :years, greater_than: 0

  def calculate_shares
    shares_arr = []
    current_value = quantity * price

    (0..years).each do |i|
      shares_arr << [i, current_value.round(2)]
      current_value += current_value * percentage / 100
    end

    self.shares = shares_arr
  end
end
