class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :content
      t.string :image
      t.integer :sns_type
      t.boolean :admin

      t.timestamps
    end
  end
end
