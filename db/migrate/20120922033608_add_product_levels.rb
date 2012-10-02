class AddProductLevels < ActiveRecord::Migration
  def up
    add_column :products, :product_level_id, :integer
    add_column :products, :custom, :integer
    create_table :product_level do |t|
      t.integer :product_level_id
      t.string	:product_subcategory
      t.string  :product_category
      t.string	:product_type
    end

  end

  def down
    drop_table :product_level
    remove_column :products, :product_level_id
    remove_column :products, :custom
  end
end
