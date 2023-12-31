class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_many :participations, dependent: :destroy
  has_many :attended_events, through: :participations, source: :event
  
  has_many :administrated_events, foreign_key: :administrator_id, class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end