class HomesController < ApplicationController
    
    def top
        @items = Item.limit(5).reverse_order
            
    end
    
end
