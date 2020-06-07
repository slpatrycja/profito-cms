class AddCodeToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :code, :string
  end
end
