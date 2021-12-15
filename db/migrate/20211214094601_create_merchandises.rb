class CreateMerchandises < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandises do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.bigint :seller_id
      t.bigint :buyer_id
      t.integer :status
      t.datetime :traded_at
      t.datetime :closed_at
      t.timestamps
    end

    add_foreign_key :merchandises, :users, column: :seller_id, on_delete: :nullify
    add_foreign_key :merchandises, :users, column: :buyer_id, on_delete: :nullify
  end
end
