class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? || @current_user == @user
  end

  def not_follow_back?
    @current_user.admin? || @current_user == @user
  end

  def stop_follow?
    @current_user.admin? || @current_user == @user
  end

  def pokemon?
    @current_user.admin? || @current_user == @user
  end

  def tags?
    true
  end
end
