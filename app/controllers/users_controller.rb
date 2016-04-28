class UsersController < ApplicationController


   before_action :info, only: :show


   def show
        @user = @client.user
        @info.update_info current_user
       @foll = @info.not_follow_back current_user
       @foed = @info.only_followed_by current_user
   end

   def index

   end

   private


    def info
        @client = Instagram.client(:access_token => current_user.authorization.acces_token)
        @info = InstaInfo.new(@client)
    end
end
