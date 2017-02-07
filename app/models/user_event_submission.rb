class UserEventSubmission < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  belongs_to :event

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
  validates :points, presence: true, numericality: { greater_than: 0 },
              if: lambda { |s| s.approved? }

  before_update do |submission|
    submission.points = 0 if submission.declined?
  end

  after_update do |submission|
    submission.date_processed = Time.now
    UserMailer.submission_notification(submission).deliver_now
  end

  def processed?
    !self.date_processed.blank?
  end


end
