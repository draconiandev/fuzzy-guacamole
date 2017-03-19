class AddStatusandSlugToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :slug, :string
    add_column :posts, :status, :string
    add_index :posts, :slug, using: :gin
    add_index :posts, :status, using: :gin
  end
end
