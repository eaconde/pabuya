class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_event_submissions
  has_many :carts

  def total_points
    user_event_submissions.within_active_period.to_a.sum(&:points)
  end

  def reached_point_limit_for(event)
    total_points >= event.max_points
  end
end
