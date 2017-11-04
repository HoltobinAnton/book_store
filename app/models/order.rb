class Order < ApplicationRecord
  include AASM
  has_many :order_items
  belongs_to :user
  belongs_to :delivery
  belongs_to :credit_card
  before_save :update_subtotal

  scope :by_waiting, -> { where(state: :waiting_processing) }
  scope :by_delivery, -> { where(state: :in_delivery) }
  scope :by_delivered, -> { where(state: :delivered) }
  scope :by_cancel, -> { where(state: :canceled) }
  default_scope { order(created_at: :desc) }

  aasm column: 'state' do
    state :waiting_processing, initial: true
    state :in_delivery, :delivered, :canceled

    event :in_delivering do
      transitions from: :waiting_processing, to: :in_delivery
    end

    event :was_delivered do
      transitions from: :in_delivery, to: :delivered
    end

    event :cancel do
      transitions from: [:waiting_processing,
                         :in_delivery,
                         :delivered], to: :canceled
    end

    event :default_state do
      transitions from: :canceled, to: :waiting_processing
    end
  end

  def subtotal_count
    order_items.collect do |oi|
      oi.valid? ? (oi.quantity * oi.unit_price) : 0
    end.sum
  end

  def order_total_count
    checked_discount.nil? ? (sub_total - discount) : sub_total
  end

  def order_total
    order_total_count + set_delivery_price
  end

  def checked_discount
    return 0 if discount.eql?(0) || discount >= sub_total
  end

  def set_delivery_price
    self.delivery.nil? ? 0 : delivery.price
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def status_active
    self.confirm_token = nil
    self.status_confirmed = true
    save!
  end

  private

  def update_subtotal
    self[:sub_total] = subtotal_count
    self[:order_total] = order_total
  end

end
