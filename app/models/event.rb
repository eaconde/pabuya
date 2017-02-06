class Event < ActiveRecord::Base
  include Bootsy::Container

  has_many :user_event_submissions
end
