class UsersController < ApplicationController

   before_action :take_client


   def show
        @user = @client.user
        @foll = InstaInfo.not_follow_back(@client,current_user.id)
   end

   def index

   end

   private

    def find_user
       @user = User.find(params[:id])
    end

    def take_client
        @client = Instagram.client(:access_token => current_user.authorization.acces_token)
    end
end
