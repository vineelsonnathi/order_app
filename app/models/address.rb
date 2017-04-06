class Address < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :address_1, :city, :state, :zip, message: "can't be blank"



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

end