class User < ActiveRecord::Base
  has_one :inst_token
  has_one :insta_user
  scope :active_user, -> { where(have_authorization: true).order('created_at desc') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable
end


