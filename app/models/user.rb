class User < ActiveRecord::Base
  has_one :authorization
  has_many :followers
  has_many :followeds
  scope :active_user, -> {where(have_authorization: true).order("created_at desc")}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def is_authorizated_now
    self.update_attributes(have_authorization: true)
  end

  def destroyUse
      self.authorization.destroy
      self.destroy
  end
end
