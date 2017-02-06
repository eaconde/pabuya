class CreateUserEventSubmissions < ActiveRecord::Migration
  def change
    create_table :user_event_submissions do |t|
      t.integer  :user_id
      t.integer  :event_id
      t.datetime :date_processed
      t.string   :attachment
      t.string   :status
      t.integer  :points, default: 0
      t.string   :notes

      t.timestamps null: false
    end
  end
end
