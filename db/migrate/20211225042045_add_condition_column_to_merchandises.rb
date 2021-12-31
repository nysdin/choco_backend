class AddConditionColumnToMerchandises < ActiveRecord::Migration[6.1]
  def up
    add_column :merchandises, :condition, :integer, null: false
  end

  def down
    remove_column :merchandises, :condition, :integer, null: false
  end
end
