class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :comment_id
      t.integer :post_id, null: false
      t.integer :account_id, null: false

      t.timestamps
    end
  end
end
