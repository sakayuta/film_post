class Film < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :genre
  has_many :film_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #投稿する際、画像がない場合に代わりにあらかじめ用意した画像を表示する記述
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  #検索でtitle と body、どちらか一方にでも検索キーワードが部分一致すれば、その作品を出力する
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
