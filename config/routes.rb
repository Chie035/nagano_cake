Rails.application.routes.draw do
  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    get 'ho'
    
  end
  
     devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
   



  devise_for :costomers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  
  
  
  
end
