class AddProblematicToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :problematic, :boolean, default: false
  end
end
