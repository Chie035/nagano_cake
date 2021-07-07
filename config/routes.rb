Rails.application.routes.draw do
  
  namespace :admins do
    get 'homes/top'
    resources :items, only: [:index,:new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :show, :edit, :update]
    resources :costomers, only: [:index, :show, :edit, :update]
  end
  
     devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
   



 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  

    
    root to: "homes#top"
    
    scope module: :public do
    devise_for :costomers
    
    resources :items, only: [:index, :show]
    
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        post :remove_item
      end
    end
    
    resources :orders, only: [:new, :create, :show, :index] do
      collection do
        get :confirm
        get :complete
      end
    end
    
    resource :costomers, :path => "mypage", only: [:show, :edit, :update] do
      collection do
        get :resign
        patch :withdraw
      end
    
    end
     
   end
  
  
end
