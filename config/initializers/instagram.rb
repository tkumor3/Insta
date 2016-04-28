require "instagram"

Instagram.configure do |config|
    config.client_id = "a5fdb1d646764e5cbc82d0a250b99abb"
    config.client_secret = "6a261b89d24b4fcf9d34ff265ac7bc7e"
end
#CALLBACK_URL = "https://inb.herokuapp.com/callback"

CALLBACK_URL = "http://localhost:3000/callback"