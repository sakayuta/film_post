class Genre < ApplicationRecord
  has_many :films, dependent: :destroy
end
