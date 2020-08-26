class RemoveCommentDefaultRestrictFromPost < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :comment, from: "None", to: nil
  end
end
