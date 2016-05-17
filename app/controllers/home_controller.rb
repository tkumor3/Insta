class HomeController < ApplicationController

    before_action :check_auth

    def index

    end

    def check_auth
        if user_signed_in? && current_user.have_authorization?
            redirect_to current_user
        end
    end
end
