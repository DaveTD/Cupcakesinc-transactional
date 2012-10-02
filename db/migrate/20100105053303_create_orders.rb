class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :order_date
    end
  end
  
  def self.down
    drop_table :orders
  end
end
