class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address
  accepts_nested_attributes_for :address

  validates_presence_of :first_name, :last_name, message: "can't be blank"

  def full_name
    self.try(:first_name) + ", " +
    self.try(:middle_initial) + ", " +
    self.try(:last_name)
  end

  def home_address
    address.try(:street_name_1) + ", " +
    address.try(:street_name_2) + ", " +
    address.try(:city) + ", " +
    address.try(:zip)
  end
end
