class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body, :name, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
