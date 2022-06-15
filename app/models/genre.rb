class Genre < ApplicationRecord
  has_many :contributions, dependent: :destroy
end
