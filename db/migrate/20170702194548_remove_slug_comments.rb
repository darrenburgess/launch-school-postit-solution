class RemoveSlugComments < ActiveRecord::Migration
  def change
    remove_column :comments, :slug, :string
  end
end
