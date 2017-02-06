class UserEventSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  SUBMISSION_STATUS = {
    approved: "Approved",
    declined: "Declined"
  }

  validates :user, presence: true
  validates :event, presence: true
  validates :points, presence: true, numericality: { greater_than: 0 },
              if: lambda { |s| s.status == 'approved' }

  after_update do |submission|
    submission.date_processed = Time.now
  end

  def processed?
    !self.date_processed.blank?
  end
end
