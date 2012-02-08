class Category < ActiveRecord::Base

  include Rails.application.routes.url_helpers 
  #default_url_options[:host] = request.host_with_port

  
  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  
  
  belongs_to :parent, :class_name => "Category", :foreign_key => "parent_id" 
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
    
  has_and_belongs_to_many :products
  
  # Docs for acts_as_nested_set https://github.com/collectiveidea/awesome_nested_set
  acts_as_nested_set :dependent => :destroy # rather than :delete_all
  
  def title
    name
  end
  
  def url
    category_products_path(id)
  end
end
