class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty
      t.decimal :unit_price, :precision => 5, :scale => 2
    end
  end
  
  def self.down
    drop_table :order_items
  end
end
