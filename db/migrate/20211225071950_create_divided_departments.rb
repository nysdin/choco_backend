class CreateDividedDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :divided_departments do |t|
      t.references :department, foreign_key: true, null: false
      t.references :merchandise, foreign_key: true, null: false
      t.timestamps
    end
  end
end
