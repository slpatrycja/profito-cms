class AddInitialsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :initials, :string
  end
end
