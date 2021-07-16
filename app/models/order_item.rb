class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    def add_tax_price
         (self.price * 1.08).round
    end
end
