class User < ActiveRecord::Base
  has_one :inst_token
  has_one :inta_user


  scope :active_user, -> {where(have_authorization: true).order("created_at desc")}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def destroyUse
      self.authorization.destroy
      self.destroy
  end


  def set_user_autorization(auth)
    unless self.have_authorization
      inst_user = InstaUser.find_or_create_by(ins_id: auth.user.id,
                                              username: auth.user.username)
      inst_user.user_id = self.id
      if inst_user.save
        InstToken.create(access_token: auth.access_token,user_id: self.id)
        self.update_attributes(have_authorization: true)
      end
    end
  end

  end

