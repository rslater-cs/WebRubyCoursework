class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.text :content
      t.string :image
      t.date :dateposted, null: false

      t.timestamps
    end
  end
end
