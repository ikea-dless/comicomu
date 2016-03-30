class ChangeTitleAndBodyToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :title, :text, limit: 65535, null: false
    change_column :posts, :body, :text, limit: 65535, null: false
  end
end
