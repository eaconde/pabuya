class CreateEventPeriods < ActiveRecord::Migration
  def change
    create_table :event_periods do |t|
      t.references :event, index: true, foreign_key: true
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps null: false
    end
  end
end
