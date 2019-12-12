class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates_presence_of :title, :body

    scope :top_five,  -> {
        left_joins(:comments)
        .group(:id)
        .order('COUNT(comments.id) DESC')
        .limit(5)
      }
end
