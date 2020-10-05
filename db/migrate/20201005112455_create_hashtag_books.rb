class CreateHashtagBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_books do |t|
      t.references :book, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
