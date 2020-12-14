class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :telephone
      t.text :message, null: false
      t.boolean :closed, null: false

      t.timestamps
    end
  end
end
