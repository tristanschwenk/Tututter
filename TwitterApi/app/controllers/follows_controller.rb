class FollowsController < ApplicationController
  before_action :set_follow, only: %i[ show update destroy ]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # POST /follows
  # POST /follows.json
  def create
    existFollow = Follow.find_by(followed_id: follow_params[:followed_id], following_id: follow_params[:following_id])

    if existFollow
      existFollow.destroy
    else
      @follow = Follow.new(follow_params)

      if @follow.save
        render :show, status: :created, location: @follow
      else
        render json: @follow.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    if @follow.update(follow_params)
      render :show, status: :ok, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:followed_id, :following_id)
    end
end
