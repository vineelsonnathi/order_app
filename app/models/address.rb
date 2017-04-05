class Address < ActiveRecord::Base

  validates_presence_of :street_name_1, :city, :state, :zip, message: "can't be blank"
end