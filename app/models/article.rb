class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true

  has_many :comments, dependent: :destroy
end
