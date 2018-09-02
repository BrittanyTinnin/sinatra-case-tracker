class User < ActiveRecord::Base
    has_many :cases
    has_secure_password
end
