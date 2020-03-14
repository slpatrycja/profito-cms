class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name, null: false

      t.references :country, foreign_key: true, null: false

      t.timestamps
    end
  end
end
