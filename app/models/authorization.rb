class Authorization < ActiveRecord::Base
    validates :name, :id_ins,  uniqueness: true
    belongs_to :user

    def self.set_user_autorization(auth,user)
        if user.authorization.nil?
            user_auth = Authorization.new(user_id: user.id)
            user_auth.acces_token = auth.access_token
            user_auth.name = auth.user.username
            user_auth.id_ins = auth.user.id
             if user_auth.save!
                 user.is_authorizated_now
             end
        end
    end
end
