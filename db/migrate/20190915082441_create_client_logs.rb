class CreateClientLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :client_logs do |t|
      t.references :client, foreign_key: true, null: false
      t.text :description, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
