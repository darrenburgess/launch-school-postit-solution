class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.timestamps
    end

    add_reference :comments, :user, index: true
    add_reference :comments, :post, index: true
  end
end
