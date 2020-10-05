class HashtagBook < ApplicationRecord
  belongs_to :book
  belongs_to :hashtag
end
