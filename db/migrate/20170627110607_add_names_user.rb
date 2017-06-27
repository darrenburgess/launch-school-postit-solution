class AddNamesUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :lastPname, :string
  end
end
