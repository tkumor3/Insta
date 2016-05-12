class UsersController < ApplicationController
    include Pundit
    after_action :verify_authorized
   before_action :info, only: :show
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

   def show
        @user = current_user.insta_user
        authorize @user_p
        UpdateRelation.build.call(@client,@user)
        InstTag.tag_from_photo(@user,@client)
       @foll = @user.was_followers
        @usr_foll = @user.followers
       @foed = @user.followers.to_a - @user.followering.to_a

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
        @client = Instagram.client(:access_token => @user_p.inst_token.access_token)

    end

    def user_not_authorized
        flash[:alert] = "You are not cool enough to do this - go back from whence you came."
        redirect_to current_user
    end


end
