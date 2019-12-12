class User < ApplicationRecord
    has_many :posts
    validates_presence_of :email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
