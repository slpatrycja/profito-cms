class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :client, foreign_key: true, null: false
      t.integer :value, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
