class UsersController < ApplicationController
  include Pundit
  
  after_action :verify_authorized
  before_action :find_user
  before_action :info, only: :show
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @user = current_user.insta_user
    authorize @user_p
    begin
      UpdateRelation.build.call(@client, @user)
      TakeTagFromPhotos.build.call(@client, @user)
      @foll = @user.was_followers
      @usr_foll = @user.followers
    rescue Instagram::BadRequest
      flash[:denger] = 'Pleas auth again'
      current_user.update_attributes(have_authorization: false)
      current_user.inst_token.destroy
      redirect_to home_path
    end
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
    begin 
      @client = Instagram.client(access_token:
                                         @user_p.inst_token.access_token)
    rescue
      flash[:alert] = 'You haven\'t got auth'
      redirect_to home_path
    end
  end

  def user_not_authorized
    flash[:alert] = 'You are not cool enough to do this
     - go back from whence you came.'
    redirect_to current_user
  end
  
  def tags
    @user = User.find(params[:id])
    authorize @user
    tags = @user.insta_user.tag_relations.order('counter desc').limit(10)
    @tag = tags.map { |content| 
        { counter: content.counter, name: content.inst_tag.name } }
  end

  private
  
  def find_user
    @user_p = User.find(params[:id])
  end

  def render_json data
    render json: data.map { |content|
              { id: content.ins_id, name: content.username } }
  end
end
