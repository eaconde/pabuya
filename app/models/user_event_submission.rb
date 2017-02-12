class UserEventSubmission < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  belongs_to :event
  belongs_to :event_period

  scope :within_active_period, -> {
    joins(:event_period).where("user_event_submissions.created_at BETWEEN
                                    event_periods.date_from AND event_periods.date_to") }

  SUBMISSION_STATUS = {
    approved: "Approved",
    declined: "Declined"
  }

  SUBMISSION_STATUS.each do |k,v|
    define_method("#{k.to_s}?".to_sym) do
      status == k.to_s
    end
  end

  validates :user, presence: true
  validates :event, presence: true
  validates :attachment, presence: true
  validates :status, presence: true, unless: :new_record?
  validates :points, presence: true,
              numericality: { greater_than: 0, less_than_or_equal_to: 2 },
              if: lambda { |s| s.approved? }

  before_create do |submission|
    submission.event_period = submission.event.event_period.active_period
  end

  before_update do |submission|
    submission.points = 0 if submission.declined?
  end

  after_update do |submission|
    submission.date_processed = Time.now
    UserMailer.submission_notification(submission).deliver_later
  end

  def processed?
    !self.date_processed.blank?
  end

  def check_point_limits
    return false if approved?
    user.reached_point_limit_for(event)
  end


end
