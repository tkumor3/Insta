require "instagram"

Instagram.configure do |config|
    config.client_id = ENV["INSTA_ID"]
    config.client_secret = ENV["INSTA_SECRET"]
end
#CALLBACK_URL = "https://inb.herokuapp.com/callback"

CALLBACK_URL = "http://localhost:3000/callback"