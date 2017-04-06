class RenameColumnNamesOfAddressFields < ActiveRecord::Migration
  def change
    rename_column :addresses, :street_name_2, :address_2
    rename_column :addresses, :street_name_1, :address_1
  end
end
