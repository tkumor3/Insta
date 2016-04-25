require "instagram"

class InstagramController < ApplicationController


    def connect
        redirect_to Instagram.authorize_url(
            :redirect_uri => CALLBACK_URL, :scope => 'follower_list public_content likes relationships comments basic')
    end

    def callback
        response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
        Authorization.set_user_autorization(response, current_user)
        redirect_to current_user
    end

    def un_follow
        id = params[:id]
        name = params[:name]
        client = Instagram.client(:access_token => current_user.authorization.acces_token)
        client.unfollow_user(id)
        flash[:success] = "unfollowed success"
        redirect_to current_user
    end



end
