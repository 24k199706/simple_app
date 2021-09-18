class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :tag_id
      t.boolean :delete_flg
      t.timestamps
    end
  end
end
