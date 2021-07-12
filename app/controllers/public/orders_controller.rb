class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @addresses = current_costomer.addresses
        #@address = Address.new
    end
    
    def confirm
        @order= Order.new(order_params)
        @addresses = current_costomer.addresses
    
        render :confirm #methodpostなのでrenderでconfirmのviewを呼び出す
    end
    
    def create
        @order = Order.new(order_params)
        
        @order.save
        redirect_to complete_orders_path
    end
    
    def complete
    end
    
    def index
    end
    
    def show
    end
    
    private
    def order_params
        params.permit(:postal_code, :address, :name)
    end
end
