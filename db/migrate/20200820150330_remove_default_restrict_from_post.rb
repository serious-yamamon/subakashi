class RemoveDefaultRestrictFromPost < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :slug, from: "None", to: nil
  end
end
