class HomesController < ApplicationController
    
    def top
        @items = Item.limit(5).order(created_at: :desc)
            
    end
    
end
