class Admins::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to root_path
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :image_id, :introduction, :price, :genre_id, :is_active)
    end
end
