class AddProductDateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_date, :datetime
  end
end
