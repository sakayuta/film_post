class Film < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :genre
  has_many :film_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  #投稿する際、画像がない場合に代わりにあらかじめ用意した画像を表示する記述
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  #投稿一覧(新しい順・古い順・いいね順・評価順）で表示する記述
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :favorited_count, -> { includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}}
  scope :star_count, -> {order(star: :desc)}
  


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #検索でtitle と body、どちらか一方にでも検索キーワードが部分一致すれば、その作品を出力する
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
