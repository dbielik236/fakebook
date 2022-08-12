class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def friend_requests
        @invitations = current_user.friend_invitations
                                   .includes(requester: { avatar_attachment: :blob} )
                                   .order('users.name')
      end

end
