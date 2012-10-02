
#puts "executing load_customers.ctl"

#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/customers.csv',
  :skip_lines => 1,
  :parser => :csv,
  :store_locally => false
}, 
[ 
  :name,
]

pre_process :truncate, :target => :development, :table => 'customers'

before_write :check_exist, {
  :target => :development, 
  :table => 'customers', 
  :columns => [:name]
}

destination :out, {
  :type => :database,
  :target => :development,
  :table => 'customers'
},
{
  :order => [:name ]
}
