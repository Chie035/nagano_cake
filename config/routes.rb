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
    
    get "/mypage" => "costomers#show"
    get "/mypage/edit" => "costomers#edit"
    get "mypage/resign" => "costomers#resign"
    get "mypage/update" => "costomers#upda"
    
   
    end
  
  
  
end
