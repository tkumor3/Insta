class AdminsController < ApplicationController
    include Pundit
    protect_from_forgery

    def all_users
        @users = User.all
    end
end
