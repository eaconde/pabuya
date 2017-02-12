class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_details, :inverse_of => :cart
  accepts_nested_attributes_for :cart_details

  CART_STATUSES = {
    pending: "Pending",
    processing: "Processing",
    completed: "Completed",
    cancelled: "Cancelled"
  }

  validates :user, presence: true
  # validates :cart_details, presence: true
  validates_associated :cart_details

  before_create do |cart|
    cart.cart_date = Date.today
  end

  before_update do |cart|
    unless cart.approved?
      cart.approved_at = Date.today
      cart.status = 'processing'
    end
  end

  after_update do |cart|
    if cart.approved?
      UserMailer.redemption_notification(cart).deliver_now
    end
  end

  def approved?
    !cart_details.where(approved: false).any?
  end

  def estimated_availability
    approved_at + 2.weeks
  end

end
