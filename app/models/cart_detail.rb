class CartDetail < ActiveRecord::Base
  belongs_to :cart
  belongs_to :catalog

  validates :cart, presence: true
  validates :catalog, presence: true
  validates :qty, presence: true, numericality: { greater_than: 0 }
  validate  :all_approved, on: :update

  def all_approved
    p "approved >> #{self.approved}|| #{approved_was} || #{approved == false}"
    if approved == true
      p "RETURNED?"
      return true
    end
    p "ERROR!"
    errors.add(:base, 'should be applied to all items.')
    # false
  end
end
