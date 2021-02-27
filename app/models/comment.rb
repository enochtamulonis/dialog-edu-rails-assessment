class Comment < ApplicationRecord
  belongs_to :article

  validates :body, presence: true
  validates :article_id, presence: true
end
