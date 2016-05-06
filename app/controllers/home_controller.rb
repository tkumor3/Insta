class HomeController < ApplicationController

    before_action :check_auth
    def index

    end

    def letsencrypt
        render text: "ohPMwTehi_fDuInVVjne4dtbMfM3RfLLT6p4Dpj6Gr4.0klUa541PeizaU6xDch_IcPc_7aPAtu_fvqYJWKYevc"
    end

    def check_auth
        if user_signed_in? && current_user.have_authorization?
            redirect_to current_user
        end
    end
end
