class Hashtag < ApplicationRecord
  has_many :hashtag_books, dependent: :destroy
  has_many :books, through: :hashtag_books
end
