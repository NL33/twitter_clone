class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable #removed for testing locally

  validates_presence_of :username, presence: true

  validates_uniqueness_of :username 

  validates_format_of :username, with: /[[:alnum:]]+/ , message: "only allows letters and numbers"

  has_many :tweets

  has_many :following_relationships
  has_many :followed_users, through: :following_relationships

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end


end
