class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @address = Address.new
    end
    
    def create
        @order = Order.new(order_params)
        @order.save
        redirect_to items_path
    end
    
    def confirm
    end
    
    def complete
    end
    
    def index
    end
    
    def show
    end
    
end
