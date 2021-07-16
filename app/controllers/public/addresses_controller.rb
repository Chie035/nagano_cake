class Public::AddressesController < ApplicationController
    
    def index
        @addresses = current_costomer.addresses.all
        @address = Address.new
        @address.costomer_id = current_costomer.id
    end
    
    def create
        @address = Address.new(address_params)
        @address.costomer_id = current_costomer.id
        @address.save!
        redirect_to addresses_path
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to addresses_path
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to addresses_path
    end
    
    private
    def address_params
        params.require(:address).permit(:postal_code, :address, :name)
    end
end
