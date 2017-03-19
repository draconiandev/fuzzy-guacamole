class AddStatusandSlugToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :slug, :string
    add_column :posts, :status, :string, null: false, default: 'draft'
    add_column :users, :slug, :string
    add_index :posts, :slug, using: :gin
    add_index :posts, :status, using: :gin
    add_index :users, :slug, using: :gin
  end
end
