require "instagram"

class InstagramController < ApplicationController

    before_action :take_data, only: [:un_follow, :follow]


    def connect
        redirect_to Instagram.authorize_url(
            :redirect_uri => CALLBACK_URL, :scope => 'follower_list public_content likes relationships comments basic')
    end

    def callback
        response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
         if InstagramAuthorization.build.call(response,current_user)
             flash[:notice] = "authorization"
            #UserM.email(current_user).deliver_now
             redirect_to current_user
         else
             flash[:alert] = "Authorization falure"
             redirect_to home_path
         end
    end

    def un_follow
        @id
        InstagramUnFollow.build.call(current_user,@client,@id)
        flash[:notice] = "unfollowed success"
        redirect_to :back

    end

    def follow

        InstagramFollow.build.call(current_user,@client,@id)
        redirect_to :back

    end

    private

    def take_data

        @id = params[:id]
        @client = Instagram.client(:access_token => current_user.inst_token.access_token)

    end


end
