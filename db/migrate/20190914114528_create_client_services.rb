class CreateClientServices < ActiveRecord::Migration[6.0]
  def change
    create_table :client_services do |t|
      t.references :client, foreign_key: true, null: false
      t.references :service, foreign_key: true, null: false
      t.references :office, foreign_key: true, null: false
      t.integer :price, null: false
      t.integer :year, null: false
      t.string :status, default: 'new', null: false
      t.text :comments

      t.timestamps
    end
  end
end
