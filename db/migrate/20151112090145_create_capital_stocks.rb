class CreateCapitalStocks < ActiveRecord::Migration
  def change
    create_table :capital_stocks do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.float :percentage
      t.integer :years
      t.float :shares, array: true, default: []
      t.timestamps null: false
    end
  end
end
