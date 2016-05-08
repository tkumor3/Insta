class UsersController < ApplicationController
    include Pundit
    after_action :verify_authorized
   before_action :info, only: :show
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

   def show
        @user = @client.user
        authorize @user_p

        @info.update_info @user_p
       @foll = @info.not_follow_back @user_p
       @foed = @info.only_followed_by @user_p
   end

   def index
       @user_list = User.active_user
       authorize User
   end

    def delete

    end

   private


    def info
        @user_p = User.find(params[:id])
        @client = Instagram.client(:access_token => @user_p.authorization.acces_token)
        @info = InstaInfo.new(@client)
    end

    def user_not_authorized
        flash[:alert] = "You are not cool enough to do this - go back from whence you came."
        redirect_to current_user
    end


end
