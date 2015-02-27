class TweetsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]  #devise method: without being logged in, can only see the index and show
 
  def index 
    @tweets = Tweet.all
    @user = current_user
    if params[:query]
      @searched_tweets = Tweet.basic_search(params[:query])
    end
  end

  def new 
    @tweet = current_user.tweets.new
  end

  def create
    @tweets = Tweet.all
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
        mentioned_users = @tweet.find_mentioned_users
        mentioned_users.each do |mentioned_user|
          @tweet.receive_email(mentioned_user)
        end
        respond_to do |format|
          format.html { redirect_to root_path}
          format.js #refers to separate tweet template--here, with create action in name (views/tweets/create.js.erb)
         end
      else
        render 'new' 
      end
  end

  def show
    @tweet = Tweet.find(params[:id]) 
    user_id = @tweet.user_id
    @user = User.where({:id => user_id }).first 
    @upvote = Upvote.new
  end

  def edit  
    if User.find(params[:user_id]) != current_user
      flash[:notice] = "You are not permitted to edit this tweet"
      redirect_to root_path
    else
      @user = current_user
      @tweet = Tweet.find(params[:id])
    end
  end

  def update 
    @tweet = Tweet.find(params[:id])
    @tweets = tweet.tweets
    

    @tweet.update(tweet_params)
     flash[:notice] = "Tweet Updated"
    redirect_to root_path
  end

 def destroy 
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
     flash[:notice] = "Tweet Deleted"
    redirect_to root_path
 end

 private

    def tweet_params
      params.require(:tweet).permit(:title, :text)
    end

end