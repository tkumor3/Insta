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



end
