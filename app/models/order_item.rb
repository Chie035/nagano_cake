class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    enum production: { 着手不可:0, 製作待ち:1, 制作中:2, 制作完了:3 }
    
    def add_tax_price
         (self.price * 1.08).round
    end
end
