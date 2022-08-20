class Genre < ApplicationRecord
  has_many :films, dependent: :destroy

  validates :name, presence: true
end
