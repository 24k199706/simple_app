class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.integer :user_id
      t.integer :post_id
      t.boolean :resign
      t.timestamps
    end
  end
end
