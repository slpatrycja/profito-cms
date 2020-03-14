class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.references :client_service, foreign_key: true, null: false
      t.date :date, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
