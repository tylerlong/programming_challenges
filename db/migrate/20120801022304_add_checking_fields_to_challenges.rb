class AddCheckingFieldsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :input_pattern, :string
    add_column :challenges, :output_pattern, :string
    add_column :challenges, :result, :text
  end
end
