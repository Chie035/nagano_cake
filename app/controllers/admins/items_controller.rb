class Admins::ItemsController < ApplicationController
    
    def index
        @items = Item.page(params[:page])
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
           redirect_to admins_item_path(@item.id)
        else
            render :new
        end
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admins_item_path(@item.id)
    end
    
    protected
    
    def item_params
        params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
    end

end