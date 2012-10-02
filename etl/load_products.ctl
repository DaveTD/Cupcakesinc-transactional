
#puts "executing load_products.ctl"

#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/products-new-source.csv',
  :skip_lines => 1,
  :parser => :csv
}, 
[ 
  :name,
  :description,
  :unit_price,
  :product_level_id,
  :custom
]

before_write :check_exist, {
  :target => :development, 
  :table => 'products', 
  :columns => [:name]
}

destination :out, {
  :type => :database,
  :target => :development,
  :table => 'products'
},
{
:order => [:name, :description, :unit_price, :product_level_id, :custom]
}
