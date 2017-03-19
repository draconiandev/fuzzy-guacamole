class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :header

      t.timestamps
    end
    add_index :posts, :title, using: :gin
  end
end
