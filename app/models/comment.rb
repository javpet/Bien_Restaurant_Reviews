class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  # Putting profanity_filter on the body so commenters can't use swear words
  profanity_filter :body

  validates :body, presence: true
end
