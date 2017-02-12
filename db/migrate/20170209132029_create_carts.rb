class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :cart_date
      t.string :status, default: 'pending'

      t.timestamps null: false
    end
  end
end
