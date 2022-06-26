class CustomerContribution < ApplicationRecord
  belongs_to :customer
  belongs_to :contribution

  enum status: { request: 0, approval: 1, rejection: 2 }
end
