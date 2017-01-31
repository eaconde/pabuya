class CreateCatalogTypes < ActiveRecord::Migration
  def change
    create_table :catalog_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
