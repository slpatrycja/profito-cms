class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :service_type, default: 'tax', null: false
      t.references :country, foreign_key: true, null: false
      t.timestamps
    end
  end
end
