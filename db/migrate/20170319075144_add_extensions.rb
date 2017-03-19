class AddExtensions < ActiveRecord::Migration[5.1]
  def change
    enable_extension "btree_gin"
    execute "create extension pg_trgm;"
  end
end
