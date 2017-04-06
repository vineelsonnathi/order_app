class Product < ActiveRecord::Base

  def product_type
    ProductType.find(product_type_id)
  end

  def self.all_product_types
    ProductType.all.map{|pt| [pt.name, pt.id] }
  end

end
