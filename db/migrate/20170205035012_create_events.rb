class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :date_from
      t.string :date_to

      t.timestamps null: false
    end
  end
end
