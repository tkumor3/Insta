class Authorization < ActiveRecord::Base
    belongs_to :user

    def self.set_user_autorization(auth,user)
        if user.authorization.nil?
            user_auth = Authorization.new(user_id: user.id)
            user_auth.acces_token = auth.access_token
            user_auth.name = auth.user.username
            user_auth.id_ins = auth.user.id
            user_auth.save!
        end
    end
end
