class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  def byUser
    @tweets = Tweet.where(user_id: params[:id])
  end

  def hashtag
    @tweets = Tweet.where(["lower(content) LIKE lower(?)", "%#"+params[:hashtag]+"%"])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    puts tweet_params
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render :show, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    if @tweet.update(tweet_params)
      render :show, status: :ok, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :is_retweet, :retweet_original_id)
    end
end
