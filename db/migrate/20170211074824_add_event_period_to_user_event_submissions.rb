class AddEventPeriodToUserEventSubmissions < ActiveRecord::Migration
  def change
    add_reference :user_event_submissions, :event_period, index: true, foreign_key: true
  end
end
