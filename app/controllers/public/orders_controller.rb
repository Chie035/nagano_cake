class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @addresses = current_costomer.addresses
        #@address = Address.new
        @order_item = OrderItem.new       
    end
    
    def confirm
        @order= Order.new(order_params)
        @order.payment_method = params[:order][:payment_method].to_i
        @addresses = current_costomer.addresses
        @order.costomer_id = current_costomer.id

        case params[:order][:address_option]
        when "1"
            @order.name = current_costomer.full_name
            @order.postal_code = current_costomer.postal_code
            @order.address = current_costomer.address
        when "2"
              select_address = Address.find(params[:order][:address1])
             @order.name = select_address.name
             @order.postal_code = select_address.postal_code
             @order.address = select_address.address
        end
        
    end
    
    def create
        @order = Order.new(order_params)
        @addresses = current_costomer.addresses
        @order.costomer_id = current_costomer.id
        
        @order.save
        
        current_costomer.cart_items.each do |cart_item|
            @order_item = @order.order_items.new
            @order_item.item_id = cart_item.item_id
            @order_item.price = cart_item.item.price
            @order_item.amount = cart_item.amount
            @order_item.save
        end
        current_costomer.cart_items.destroy_all
  

        redirect_to complete_orders_path
    end
    
    def complete
    end
    
    def index
        @orders = current_costomer.orders.all
        @order_items = OrderItem.all
    end
    
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items.all
    end
    
    private
    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :price)
    end
    
    #def order_item_params
       # params.require(:order_item).permit(:amount, :price, :item_id)
    #end
    
end
