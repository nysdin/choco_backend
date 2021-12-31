class CreateMerchandiseImages < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandise_images do |t|
      t.string :url, null: false
      t.references :merchandise, foreign_key: true, null: false
      t.timestamps
    end
  end
end
