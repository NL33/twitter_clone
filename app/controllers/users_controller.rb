class UsersController < ApplicationController
  #def create
   # @user = User.new(params[:user])
  #end

  def show
   @user = User.find(params[:id])
   @following_relationship = current_user.following_relationships.new
  end
end