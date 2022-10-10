class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id #variable generada por Devise (current_user)
    if @tweet.save
      redirect_to tweets_path # /tweets
    else
      render "new", status: :unprocessable_entity, alert: "Don't save."
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = Comment.where(tweet_id: @tweet.id).order(created_at: :desc)
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was successfully update."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, status: :see_other, notice: "Tweet was successfully destroyed."
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
