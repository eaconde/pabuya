class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :catalog, index: true, foreign_key: true
      t.integer :qty
      t.integer :cost

      t.timestamps null: false
    end
  end
end
