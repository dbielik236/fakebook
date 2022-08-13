class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def create
        friendship = Friendship.create(friend_a_id: current_user.id, friend_b_id: params[:recipient_id])
        if friendship.save
          
          redirect_to users_path, alert: "Friendship added!"
        else
          redirect_back fallback_location: user_url(current_user), alert: "Sorry, your request could not be completed. (#{friend_request.errors.full_messages.join(', ')}.)"
        end
    end


end
