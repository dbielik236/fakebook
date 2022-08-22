class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def create
  end

  def show
    @friend_request 
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if Friendship.find_by(friend_b_id: current_user.id, friend_a_id: @user.id).nil?
      @friendship = Friendship.destroy_by(friend_a_id: current_user.id, friend_b_id: @user.id)
      respond_to do |format|
        
          format.html { redirect_to user_url(@user), notice: "Unfriend successful." }
          format.json { render :show, status: :ok, location: @user }
      end
    elsif Friendship.find_by(friend_a_id: current_user.id, friend_b_id: @user.id).nil?
      @friendship = Friendship.destroy_by(friend_b_id: current_user.id, friend_a_id: @user.id)
      respond_to do |format|
        
          format.html { redirect_to user_url(@user), notice: "Unfriend successful." }
          format.json { render :show, status: :ok, location: @user }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :location, :origin, :occupation, :education, :birthday, :description)
  end
end
