class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :description
    end
  end
  
  def self.down
    drop_table :customers
  end
end
