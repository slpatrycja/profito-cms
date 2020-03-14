class CreateClientGlobalServices < ActiveRecord::Migration[6.0]
  def change
    create_table :client_global_services do |t|
      t.references :client, foreign_key: true, null: false
      t.references :global_service, foreign_key: true, null: false
      t.integer :price, null: false
      t.text :comments

      t.timestamps
    end
  end
end
