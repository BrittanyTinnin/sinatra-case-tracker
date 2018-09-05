class User < ActiveRecord::Base
    has_many :cases
    has_secure_password
    validates_uniqueness_of :username
    validates :username, presence: true
    validates :email, presence: true
    validates :presence, presence: true
end
