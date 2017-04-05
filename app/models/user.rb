class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address
  accepts_nested_attributes_for :address

  def full_name
    first_name + ", " + middle_initial + ", " + last_name
  end

  def home_address
    address.street_name_1 + ", " + address.street_name_2 + ", " + address.city + ", " + address.zip + ", " + address.zip_plus_four
  end
end
