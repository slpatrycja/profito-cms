class AddMoreIdnRsToClients < ActiveRecord::Migration[6.0]
  def up
    remove_column :clients, :idnr

    add_column :clients, :idnr_de, :string
    add_column :clients, :idnr_nl, :string
    add_column :clients, :idnr_be, :string
    add_column :clients, :idnr_at, :string
    add_column :clients, :steuernummer, :string
  end

  def down
    add_column :clients, :idnr, :string

    remove_column :clients, :idnr_de
    remove_column :clients, :idnr_nl
    remove_column :clients, :idnr_be
    remove_column :clients, :idnr_at
    remove_column :clients, :steuernummer
  end
end
