class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email
      t.string :pesel, null: false
      t.date :birth_date, null: false
      t.string :telephone, null: false
      t.string :country, null: false, default: 'Poland'
      t.string :voivodeship, null: false
      t.string :postal_name, null: false
      t.string :postal_code, null: false
      t.string :city
      t.string :street
      t.string :house_number
      t.string :idnr
      t.string :marital_status, default: 'married', null: false
      t.date :wedding_date
      t.text :comment

      t.timestamps
    end
  end
end
