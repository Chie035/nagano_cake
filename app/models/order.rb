class Order < ApplicationRecord
    belongs_to :costomer
    has_many :order_items, dependent: :destroy
    
    enum payment_method: { クレジットカード:0, 銀行振込:1 }
    enum order_received: { 入金待ち:0, 入金確認:1, 制作中:2, 発送準備中:3, 発送済み:4 }
    
    def shipping_cost
        800
    end
    
    def address_only
       "〒" + self.postal_code + "　" + self.address
    end
end
