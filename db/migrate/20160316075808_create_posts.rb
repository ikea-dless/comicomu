class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.datetime :deadline_at, null: false
      t.references :user, index: true, foreign_key: true
      t.integer :status, limit: 1, default: 0, null: false

      t.timestamps null: false
    end
  end
end
