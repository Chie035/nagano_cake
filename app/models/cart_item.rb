class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :costomer
    
     
    def add_tax_price
         (self.item.price * 1.08).round
    end
    
    #def subtotal_price
     #   (self.add_tax_price * cart_item.amount).round
    #end
end
