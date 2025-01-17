class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.integer :addressable_id
      t.string :addressable_type
      t.text :address_detail
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.integer :created_by

      t.timestamps
    end
  end
end
