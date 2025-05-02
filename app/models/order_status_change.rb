class OrderStatusChange < ApplicationRecord
    belongs_to :order
    belongs_to :actor, polymorphic: true
  
    validates :previous_status, :new_status, presence: true
  end