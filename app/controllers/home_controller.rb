class HomeController < ApplicationController
    before_action :check_auth
    def index

    end

    def check_auth
        unless current_user.authorization.nil?
            redirect_to current_user
        end
    end
end
