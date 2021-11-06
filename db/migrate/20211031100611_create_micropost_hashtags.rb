class CreateMicropostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_posts, id: false  do |t|
      t.references :post_id, index: true, foreign_key: true
      t.references :tag_id, index: true, foreign_key: true
    end
  end
end
