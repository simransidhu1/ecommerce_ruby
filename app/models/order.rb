class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items, dependent: :destroy

  # Validations
  validates :user_id, presence: true
  validates :province_id, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  STATUSES = %w[pending paid shipped delivered cancelled].freeze

  # Add validation for status
  validates :status, inclusion: { in: STATUSES }
  

 


 

  accepts_nested_attributes_for :order_items
  scope :recent, -> { order(created_at: :desc) }
end
