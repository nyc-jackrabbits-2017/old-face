class Friendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :sender_id, null: false, foreign_key: true
      t.integer :receiver_id, null: false, foreign_key: true
      t.boolean :accepted?, default: false

      t.timestamps null: false
    end
    add_index :friendships, [:sender_id, :receiver_id], unique: true
  end
end
