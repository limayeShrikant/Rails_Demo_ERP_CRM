class CreateSalesProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_proposals do |t|
      t.bigint :lead_id
      t.string :lead_name, null: false
      t.string :status
      t.string :state
      t.string :architect_name
      t.string :architect_contact
      t.string :source
      t.boolean :won
      t.boolean :lost
      t.string :quotation_reference
      t.date :quotation_date
      t.decimal :won_qty, precision: 15, scale: 4
      t.string :won_unit
      t.text :lost_against_information
      t.decimal :alternate_product_rate, precision: 19, scale: 4
      t.date :won_date
      t.string :product
      t.datetime :last_opened_on
      t.boolean :locked, default: false
      t.datetime :locked_on
      t.bigint :project_execution_id
      t.references :created_by, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
