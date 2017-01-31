class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :description
      t.string :points
      t.references :catalog_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
