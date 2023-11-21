class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :comment_text, presence: true
end
