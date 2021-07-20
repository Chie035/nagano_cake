class Admins::OrdersController < ApplicationController
    
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
       
        
        case params[:order][:order_received] 
            when "入金確認"
            @order_items = @order.order_items
            @order_items.each do |order_item|
               order_item.update(production: 1) 
            end
            
            
           
        else
            @order.update(order_params)
           
        end
         redirect_to admins_order_path(@order.id)
    end
    
    private
    def order_params
        params.require(:order).permit(:order_received)
    end
end
