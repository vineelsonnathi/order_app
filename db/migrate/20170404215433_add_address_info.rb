class AddAddressInfo < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      # t.belongs_to :user, foreign_key: true, index: true
      t.string :street_name_1
      t.string :street_name_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :zip_plus_four
    end
  end
end