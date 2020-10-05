class Book < ApplicationRecord
  belongs_to :user
  has_many :hashtag_books, dependent: :destroy
  has_many :hashtags, through: :hashtag_books
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  

  #DBへのコミット直前に実行
  after_create do
    #1.controller側でcreateしたTweetを取得
    book = Book.find_by(id: self.id)
    #2.正規表現を用いて、Tweetのtext内から『#○○○』の文字列を検出
    hashtags  = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #3.mapメソッドでtags配列の要素一つ一つを取り出して、先頭の#を取り除いてDBへ保存する
    hashtags.uniq.map do |t|
      hashtag = Hashtag.find_or_create_by(hashname: t.downcase.delete('#'))
      book.hashtags << hashtag
    end
  end
end
