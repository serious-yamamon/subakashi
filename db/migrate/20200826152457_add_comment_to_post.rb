class AddCommentToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment, :string, null: false, default: ""
  end
end
