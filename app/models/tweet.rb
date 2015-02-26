class Tweet < ActiveRecord::Base
 validates :text, presence: true, length: { maximum: 140, message: "was interesting, but too long. Please try again." }
 belongs_to :user

 def show_user_email
  user_id = self.user_id
  user = User.where({:id => user_id}).first
  user.email
 end


end
