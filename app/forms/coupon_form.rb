class CouponForm < Rectify::Form

  attribute :discount, Float
  attribute :secret_code, String

  #validates :secret_code, presence: true
  validates :secret_code, length: { maximum: 30 }

end