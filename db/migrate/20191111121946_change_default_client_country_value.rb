class ChangeDefaultClientCountryValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:clients, :country, 'Polska')
  end

  def down
    change_column_default(:clients, :country, 'Poland')
  end
end
