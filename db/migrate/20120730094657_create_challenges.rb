class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :position, null: false
      t.integer :level, null: false
      t.text :question, null: false
      t.text :hints, null: false
      t.text :solution, null: false

      t.timestamps
    end
    add_index :challenges, :position, unique: true
    add_index :challenges, :level
  end
end
