class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :phone
      t.string :city
      t.integer :created_by

      t.timestamps
    end
  end
end
