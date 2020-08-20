class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.text :text, null: false
      t.text :image
      t.boolean :published, null: false, default: 0
      t.boolean :favorite, null: false, default: 0
      t.references :writer, foreign_key: true, null: false, default: 1
      t.references :category, foreign_key: true, null: false
      t.references :series, foreign_key: true
      t.timestamps
    end
  end
end
