class Public::CartItemsController < ApplicationController
    
    def index
         @cart_items = current_costomer.cart_items
    end
    
    def update
        @cart_item = current_costomer.cart_item
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def remove_item
    end
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        
        @cart_item.item_id = Item.find_by(id: params[:cart_item][:item_id]).id
        @cart_item.costomer_id = current_costomer.id
        
        @cart_item.save
        redirect_to cart_items_path
    end
    
    def destroy
       
    end
    
    private
    def cart_item_params
        params.require(:cart_item).permit(:amount)
    end
    
    
end
