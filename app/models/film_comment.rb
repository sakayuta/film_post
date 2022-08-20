class FilmComment < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :comment, presence: true, length: { maximum: 150 }

end
