class Item < ApplicationRecord
    attachment :image
    
    belongs_to :genre
    
    def add_tax_price
         (self.price * 1.08).round
    end
    
    #enum is_active: {on_sale:1, sold_out:0}
end
