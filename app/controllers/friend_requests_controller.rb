class FriendRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_friend_request, except: :create
  
    def create
      friend_request = FriendRequest.create(requester_id: current_user.id, recipient_id: params[:recipient_id])
      if friend_request.save
        
        redirect_to users_path, alert: "Request sent!"
      else
        redirect_back fallback_location: user_url(current_user), alert: "Sorry, your request could not be completed. (#{friend_request.errors.full_messages.join(', ')}.)"
      end
    end
  
    private
  
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end
end
