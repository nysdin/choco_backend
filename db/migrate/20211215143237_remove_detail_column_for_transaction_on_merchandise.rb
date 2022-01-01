class RemoveDetailColumnForTransactionOnMerchandise < ActiveRecord::Migration[6.1]
  def change
    remove_column :merchandises, :status, :integer
    remove_column :merchandises, :traded_at, :datetime
    remove_column :merchandises, :closed_at, :datetime
  end
end
