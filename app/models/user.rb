class User < ActiveRecord::Base
  has_one :authorization
  has_many :followers
  has_many :followeds
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
