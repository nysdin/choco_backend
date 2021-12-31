class AddPublicStatusColumnColumnToMerchandises < ActiveRecord::Migration[6.1]
  def up
    add_column :merchandises, :public_status, :integer, null: false
  end

  def down
    remove_column :merchandises, :public_status, :integer, null: false
  end
end
