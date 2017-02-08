class Event < ActiveRecord::Base
  include Bootsy::Container

  has_many :user_event_submissions

  validates :date_from, presence: true

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
