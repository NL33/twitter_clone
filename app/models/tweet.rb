class Tweet < ActiveRecord::Base

 belongs_to :user

 def show_user_email
  user_id = self.user_id
  user = User.where({:id => user_id}).first
  user.email
 end

end
