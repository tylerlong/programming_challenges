class AndTopicToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :topic, :string, null: false
    add_index :challenges, :topic
  end
end
