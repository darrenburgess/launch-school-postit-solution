class FixUserLastName < ActiveRecord::Migration
  def change
    rename_column :users, :lastPname, :last_name
  end
end
