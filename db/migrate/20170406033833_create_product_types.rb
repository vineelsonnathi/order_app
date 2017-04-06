class CreateProductTypes < ActiveRecord::Migration
  def change
    add_column :products, :product_type_id, :integer

    create_table :product_types, force: true do |t|
      t.string :name
      # t.belongs_to :product, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
