class Public::CartItemsController < ApplicationController
    
    def index
         @cart_items = current_costomer.cart_items
    end
    
    def create
            @cart_item = CartItem.new(cart_item_params)
            
            
            @cart_item.item_id = Item.find_by(id: params[:cart_item][:item_id]).id
            @cart_item.costomer_id = current_costomer.id
            
            in_cart = current_costomer.cart_items.find_by(item_id: params[:cart_item][:item_id]) 
        if in_cart.present?
            in_cart.update(amount: in_cart.amount + params[:cart_item][:amount].to_i)
            
            redirect_to cart_items_path
        
        else
             @cart_item.save!
            redirect_to cart_items_path
        end
    end
    
    def update
        @cart_item = current_costomer.cart_items.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def destroy_all
        @cart_items = current_costomer.cart_items
        @cart_items.destroy_all
        redirect_to costomers_path
    end
    
    def destroy
       @cart_item = current_costomer.cart_items.find(params[:id])
       @cart_item.destroy
       redirect_to cart_items_path
    end
    
    private
    def cart_item_params
        params.require(:cart_item).permit(:amount, :item_id)
    end
    
    
end
