class Item < ApplicationRecord
    attachment :image
    
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_items, dependent: :destroy
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    
    def add_tax_price
         (self.price * 1.08).round
    end
    
    
    
    #boolean型の場合はenumではなくviewにif文で書く
   # enum is_active: {"販売中":true, "販売停止中":false}
end
