class AddMoreColumnsInAddressTable < ActiveRecord::Migration
  def change
    add_column :addresses, :phone_number, :string
    add_column :addresses, :email, :string
  end
end
