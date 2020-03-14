class CreateGlobalServices < ActiveRecord::Migration[6.0]
  def change
    create_table :global_services do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
