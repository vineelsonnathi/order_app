class Address < ActiveRecord::Base

  serialize :product_ids, Array

  validates_presence_of :first_name, :last_name, :phone_number, :email, :address_1, :city, :state, :zip, message: "can't be blank"



  def full_name
    first_name + "," + last_name
  end

  def home_address
    addr = address_1 + ", "
    addr += address_2 + ", " if address_2.present?
    addr += city + ", "
    addr += state + ", "
    addr += zip
    addr
  end

 # may need this for future report generation.
  def products
    Product.where(id: product_ids)
  end

end