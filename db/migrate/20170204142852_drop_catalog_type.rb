class DropCatalogType < ActiveRecord::Migration
  def change
    remove_column :catalogs, :catalog_type_id
    drop_table :catalog_types
  end
end
