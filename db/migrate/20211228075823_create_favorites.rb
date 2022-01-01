class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :merchandise, foreign_key: true
      t.timestamps
    end
  end
end
