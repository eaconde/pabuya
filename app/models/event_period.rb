class EventPeriod < ActiveRecord::Base
  belongs_to :event
  has_one    :user_event_submission

  validates :event, :date_from, :date_to, presence: true

  def self.active_period
    where("? BETWEEN date_from AND date_to", Date.today).first
  end

end
