class Bookmark < ApplicationRecord
  belongs_to :review
  belongs_to :user

  # We want to make sure here we have one review / user ---> who bookmarked to avoid doublebookmarking possibility
  validates :review, uniqueness: { scope: :user }
end
