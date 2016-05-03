class UserPolicy < ApplicationPolicy
    attr_reader :current_user, :model

    def initialize(current_user, model)
        @current_user = current_user
        @user = model
    end

    def show?
        @current_user.admin? or @current_user == @user
    end



end