class Public::CostomersController < ApplicationController
    def show
        @costomer = current_costomer
    end
    
    def edit
        @costomer = current_costomer
    end
    
    def update
        @costomer = current_costomer
        @costomer.update(costomer_params)
        redirect_to costomers_path
    end
    
    def resign
        @costomer =current_costomer
    end
    
    def withdraw
        @costomer = current_costomer
        @costomer.update(is_active: false)
        reset_session
        redirect_to root_path
    end
    
    private
    def costomer_params
        params.require(:costomer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end
    
end
