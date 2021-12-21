class AddEvaluationColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :evaluation, :integer, null: false, default: 5
  end
end
