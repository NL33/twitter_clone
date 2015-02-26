class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable #removed for testing locally

  has_many :tweets

   after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirm(self).deliver
  end
end
