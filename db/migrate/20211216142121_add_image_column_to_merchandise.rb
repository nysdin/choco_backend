class AddImageColumnToMerchandise < ActiveRecord::Migration[6.1]
  def change
    add_column :merchandises, :image, :text
  end
end
