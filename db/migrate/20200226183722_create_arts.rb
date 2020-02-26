class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :price
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
