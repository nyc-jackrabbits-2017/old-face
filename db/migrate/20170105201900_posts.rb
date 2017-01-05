class Posts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :poster_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
