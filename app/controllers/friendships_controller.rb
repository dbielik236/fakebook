class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friendship = Friendship.create(friend_a_id: current_user.id, friend_b_id: params[:friend_b_id])
    if friendship.save
      FriendRequest.destroy_by(requester_id: params[:friend_b_id])
      redirect_to user_path(params[:friend_b_id]), alert: "Friendship added!"
    else
      redirect_back fallback_location: user_url(current_user), alert: "Sorry, your request could not be completed. (#{friendship.errors.full_messages.join(', ')}.)"
    end
  end

  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: user_url(current_user), notice: 'Friendship was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
