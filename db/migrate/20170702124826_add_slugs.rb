class AddSlugs < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_column :comments, :slug, :string
    add_column :categories, :slug, :string
  end
end
