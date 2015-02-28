class FollowingRelationshipsController < ApplicationController
   #def new 
    #@follower_relationship = current_user.follower_relationships.new(following_relationship_params)
 # end

  def create
    @following_relationship = current_user.following_relationships.new(:followed_user_id => params[:followed_user_id])
    followed_user = User.where({:id => @following_relationship.followed_user_id}).first
    if @following_relationship.save
      flash[:notice] = "you are now following #{followed_user.username}."
      redirect_to :back
    else
      flash[:notice] = "Unable to follow."
      redirect_to :back
    end
  end

  #private

    #def following_relationship_params
     # params.require(:following_relationship).permit(:user_id, :followed_user_id)
    #end
end