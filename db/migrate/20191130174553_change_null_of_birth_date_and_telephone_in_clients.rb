class ChangeNullOfBirthDateAndTelephoneInClients < ActiveRecord::Migration[6.0]
  def change
    change_column_null :clients, :birth_date, true
    change_column_null :clients, :telephone, true
  end
end
