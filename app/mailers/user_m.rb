class UserM < ApplicationMailer
    default from: 'tkumor3@gmail.com'
    def email(user)
        @user = user
        @url  = 'http://localhost:3000'
        mail(to:  @user.email , subject: "Registered")
    end
end
