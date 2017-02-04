class Catalog < ActiveRecord::Base
  has_one :category

  validates :name, presence: true
end
