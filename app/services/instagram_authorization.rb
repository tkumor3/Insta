class InstagramAuthorization

    def self.build
        new
    end


    def call(auth,current_user)
        unless current_user.have_authorization
            inst_user = InstaUser.find_or_create_by(ins_id: auth.user.id,
                                                    username: auth.user.username)
            inst_user.user_id = current_user.id
            inst_user.profile_picture = auth.user.profile_picture
            if inst_user.save
                InstToken.create(access_token: auth.access_token,user_id: current_user.id)
                current_user.update_attributes(have_authorization: true)
            end
        end
    end

end