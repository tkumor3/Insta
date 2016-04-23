class UsersController < ApplicationController
   before_action :find_user, only: :show
   before_action :take_client


   def show


   end

   def index

   end

   private

    def find_user
       @user = User.find(params[:id])
    end

    def take_client
        @client = Instagram.client(current_user.authorization.acces_token)
    end
end
