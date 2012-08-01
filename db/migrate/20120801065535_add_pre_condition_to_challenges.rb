class AddPreConditionToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :pre_condition, :text
  end
end
