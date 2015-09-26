class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
    @myFollowers = Follow.find_followers(current_user.id)
    #@myNonFollowers = Follow.find_nonfollowers(current_user.id)

  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = current_user.follows.build
  end

  def listNonFollowers
    @myFollowers = Follow.find_followers(current_user.id)
    allUsers = User.all
    allUsers_id = []
    followers_id = []
    
    for user in allUsers
      allUsers_id.push(user.id)
    end
      
    for follower in @myFollowers
      followers_id.push(follower.follower_id)
    end
    
    non_followers_id = (allUsers_id - followers_id - [current_user.id])
    @allUsers = []
    
    for non_follower in non_followers_id
      @allUsers.push(User.find(non_follower))
    end
  end

  def find_my_following
    @myFollowing = Follow.find_following(current_user.id)
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json

  def create
    @follow = current_user.follows.build(:follower_id => params[:follower_id])
    if @follow.save
      flash[:notice] = "Added a follower."
      redirect_to follows_url
    else
      flash[:notice] = "Failed to save"
      redirect_to root_path
    end
  end



  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follower was removed' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_params
      params.require(:follow).permit(:user_id, :follower_id)
    end
end
