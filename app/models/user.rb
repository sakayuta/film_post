class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :films, dependent: :destroy
  has_many :film_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image

  #user登録する際、画像がない場合に代わりにあらかじめ用意した画像を表示する記述
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  #ゲストログイン用の記述
  def self.guest
    find_or_create_by!(name: 'guestuser', name_kana: 'guestuser', sex: 'man', age_group: 'early20', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

 enum sex: { man: 0, woman: 1 }
 enum age_group: { under19: 0, early20: 1, older20: 2, early30: 3, older30: 4, early40: 5, older40: 6, early50: 7, older50: 8, over61: 9  }
end
