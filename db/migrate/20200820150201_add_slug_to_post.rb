class AddSlugToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slug, :string, null: false, default: ""
    add_index :posts, :slug, unique: true
  end
end
