class Event < ActiveRecord::Base
  include Bootsy::Container

  has_many :user_event_submissions
  has_many :event_periods

  validates :name, presence: true

  before_create do |event|
    date_from = Date.today
  end

  # TODO: create task that automatically creates period if current period
  # =>    is about to expire...
  after_create do |event|
    # TODO: incr value should be in preference
    incr = 3.months
    # generate periods based on date_from
    event_periods.create(date_from: Date.today, date_to: Date.today + incr)
  end

  def max_points
    # TODO: needs flexibility
    months = date_diff date_from.to_date, Date.today
    months * range_max_points
  end

  private

  def date_diff(date1, date2)
    month = (date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)
    year, months = month.divmod(12)
    year * 12 + months
  end
end
