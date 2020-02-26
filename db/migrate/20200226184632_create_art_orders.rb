class CreateArtOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :art_orders do |t|
      t.references :art, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
