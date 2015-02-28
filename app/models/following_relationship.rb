class FollowingRelationship < ActiveRecord::Base 
	belongs_to :user
	belongs_to :followed_user, :class_name => "User" #(ie, belongs to a user and the person that user is following. We specify class_name because there is not a separate “followed_user” model. So we tell rails we want to use user as the model for the association.)

	def show_followed_user
	 user = User.where({:id => self.followed_user_id}).first
	 user
	end 

end