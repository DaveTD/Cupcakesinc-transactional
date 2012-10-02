
#puts "executing load_products.ctl"

#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/orders.csv',
  :skip_lines => 1,
  :parser => :csv
}, 
[ 
  :order_id,
  :customer_id,
  :order_date,
  :product_id,
  :qty,
  :unit_price
]

pre_process :truncate, :target => :development, :table => 'order_items'
pre_process :truncate, :target => :development, :table => 'orders'

before_write :copy_field, :destination => :id, :source => :order_id

destination :order, {
  :type => :database,
  :target => :development,
  :table => 'orders',
  :unique => [:id]
},
{
  :order => [:id, :customer_id, :order_date ]
}

destination :order_lines, {
  :type => :database,
  :target => :development,
  :table => 'order_items'
},
{
  :order => [:order_id, :product_id,:qty, :unit_price]
}
