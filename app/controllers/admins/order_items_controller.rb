class Admins::OrderItemsController < ApplicationController
    
    def update
        order_item = OrderItem.find(params[:id])
        order = order_item.order
        
        
        if params[:order_item][:production] ==  "制作中"
            #order_item.order.order_received = "制作中"          
            order_item.update(order_item_params)
            order.update(order_received: "制作中")
           
          # orderにひもづいているorder_items
        elsif  params[:order_item][:production] ==  "制作完了"
             order_item.update(order_item_params)
             #p order.order_items.count
             #p order.order_items.where(production: "制作完了").count
            if order.order_items.where(production: "制作完了").count == order.order_items.count
             order.update(order_received: "発送準備中")
            end
        else
             order_item.update(order_item_params)
        end
             redirect_to admins_order_path(order)
    end
    
    private
    def order_item_params
        params.require(:order_item).permit(:production)
    end
end
