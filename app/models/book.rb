class Book < ApplicationRecord
  validates :title, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :materials
  has_many :pictures, as: :imageable
  has_many :reviews
  has_many :order_items
  belongs_to :dimension

  mount_uploader :photos, AvatarUploader

  scope :best_sellers, -> { joins(:order_items).distinct(:book_id).first(4) }
  scope :new_books_slider, -> { order(:created_at).first(3) }

  scope :new_books, -> { order(created_at: :desc) }
  scope :title_asc, -> { order(title: :asc) }
  scope :title_desc, -> { order(title: :desc) }
  scope :low_price, -> { order(price: :asc) }
  scope :high_price, -> { order(price: :desc) }

  def check_count?(count)
    self.quantity >= count ? true : false
  end

  def purchase_of_book(count)
      self.update(quantity: self.quantity - count) if check_count?(count) 
  end

  def total_price(count)
    self.price * count if check_count?(count)
  end

end
