require "instagram"

class InstagramController < ApplicationController


    def connect
        redirect_to Instagram.authorize_url(
            :redirect_uri => CALLBACK_URL, :scope => 'follower_list public_content likes relationships comments basic')
    end

    def callback
        response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
         if Authorization.set_user_autorization(response, current_user)
             flash[:notice] = "authorization"
             redirect_to current_user
         else
             flash[:alert] = "Authorization falure"
             redirect_to home_path
         end

    end

    def un_follow
        id = params[:id]
        client = Instagram.client(:access_token => current_user.authorization.acces_token)
        client.unfollow_user(id)
        flash[:notice] = "unfollowed success"
        redirect_to :back
    end

    def want_follow
        id = params[:id]
        current_user.followers.find_by(ins_id: id).i_want_follow()
        redirect_to :back
    end



end
