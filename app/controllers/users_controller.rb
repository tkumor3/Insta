class UsersController < ApplicationController
    include Pundit
    after_action :verify_authorized
    before_action :get_user
    before_action :info, only: :show
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

   def show
        @user = current_user.insta_user
        authorize @user_p
        UpdateRelation.build.call(@client,@user)
        TakeTagFromPhotos.build.call(@client,@user)
        @foll = @user.was_followers
        @usr_foll = @user.followers
   end

   def index
       @user_list = User.active_user
       authorize User
   end


   def not_follow_back
       authorize @user_p
       render_json(@user_p.insta_user.followering - @user_p.insta_user.followers)
   end


    def stop_follow
        authorize @user_p
        render_json(@user_p.insta_user.was_followers)
    end

    def pokemon
        authorize @user_p
        render_json(@user_p.insta_user.followers - @user_p.insta_user.followering)
    end

    def info
        @client = Instagram.client(:access_token => @user_p.inst_token.access_token)
    end

    def user_not_authorized
        flash[:alert] = "You are not cool enough to do this - go back from whence you came."
        redirect_to current_user
    end

    private

        def get_user
            @user_p = User.find(params[:id])
        end

        def render_json data

            render json: data.map {|content|
                {id: content.ins_id , name: content.username}}
        end

end
