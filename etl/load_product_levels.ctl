
#puts "executing load_product_levels.ctl"

#ETL::Engine.logger = Logger.new(STDOUT)
#ENT::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/product-level-source.csv',
  :skip_lines => 1,
  :parser => :csv,
  :store_locally => false
},
[
  :product_level_id,
  :product_subcategory,
  :product_category,
  :product_type
]

pre_process :truncate, :target => :development, :table => 'product_level'

before_write :check_exist, {
  :type => :database,
  :target => :development,
  :table => 'product_level',
  :columns => [:product_level_id, :product_subcategory, :product_category, :product_type]
}

destination :out, {
  :type => :database,
  :target => :development,
  :table => 'product_level'
}
