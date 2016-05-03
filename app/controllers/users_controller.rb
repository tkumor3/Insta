class UsersController < ApplicationController
include Pundit
    before_action :authenticate_user!
   after_action :verify_authorized
   before_action :info, only: :show


   def show
        @user = @client.user
        authorize @user_p
        @info.update_info @user_p
       @foll = @info.not_follow_back @user_p
       @foed = @info.only_followed_by @user_p
   end

   def index

   end

   private


    def info
        @user_p = User.find(params[:id])
        @client = Instagram.client(:access_token => @user_p.authorization.acces_token)
        @info = InstaInfo.new(@client)
    end


end
