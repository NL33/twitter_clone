class Tweet < ActiveRecord::Base
 validates :text, presence: true, length: { maximum: 140, message: "was interesting, but too long. Please try again." }
 belongs_to :user

 def show_user_email
  user_id = self.user_id
  user = User.where({:id => user_id}).first
  user.email
 end

 def find_mentioned_users
  users = []
  scan_results = self.text.scan(/@[[:alnum:]]+/i) #scan the text for @ followed by any alpha/numeric character(or characters), case insensitive. No whitespace "+" means any of here. Returns an array of matches.
  if scan_results
  	scan_results.each do | result | #another method: scan_results.map { |result| result.delete "@"}
  	  user_name = result.delete "@"  #deletes "@". Another method would be result.slice(0) to delete first character.
  	  user = User.where({:username => user_name}).first
  	  users << user
     end
   end
    users
  end

  def receive_email(mentioned_user)
    UserMailer.notification_email(mentioned_user, self).deliver
  end  #action is called by the controlle. Notification_email is defined in the UserMailer.rb file
end
