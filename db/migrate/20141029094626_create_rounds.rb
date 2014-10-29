class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, null:false
      t.integer :deck_id, null:false
      t.integer :guess_lives, default: 8

      t.timestamps
    end
  end
end
