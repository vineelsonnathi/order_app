class Product < ActiveRecord::Base
  belongs_to :product_type, foreign_key: :product_type_id

  def product_type
    ProductType.find(product_type_id)
  end

  def self.all_product_types
    ProductType.all.map{|pt| [pt.name, pt.id] }
  end

end
