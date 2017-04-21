class Coupon < ApplicationRecord
  validates :secret_code, :discount, presence: true
  
  def check_secret_code?(str_code)
    self.secret_code.eql?(str_code)
  end
end
