class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable #removed for testing locally

  validates :username, presence: true, uniqueness: true, format: { with: /[[:alnum:]]+/ , message: "only allows letters and numbers" }

  has_many :tweets

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end


end
