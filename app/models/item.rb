class Item < ApplicationRecord
    attachment :image
    
    belongs_to :genre
    
    def add_tax_price
         (self.price * 1.08).round
    end
    
   # enum is_active: {"販売中":true, "販売停止中":false}
end
