class Contribution < ApplicationRecord
  has_many :customer_contributions, dependent: :destroy
  has_many :customers, through: :customer_contributions
  #中間テーブルを作る時は、through: :中間テーブル名
  belongs_to :customer
  belongs_to :genre
  def remaking_numbers
    current_numbers = self.customer_contributions.where.not(status: :"rejection").length
    self.recruitment_numbers - current_numbers
  end
end
