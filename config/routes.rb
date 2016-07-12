Rails.application.routes.draw do
  resources :tenants do 
    resources :pmus
    resources :purchases
    resources :paralavis
    resources :lots
    resources :loose_berries

    # workforce 
    resources :courses
    resources :shift_lists
    resources :attendances
    resources :worker 
  end 


  resources :tenants do
      resources :palets
      resources :loadings
      resources :growers do
        resources :pmus 
              resources :lots  
      end

      resources :loadings
    resources :projects do 
      resources :palets
      resources :loadings
    end

  end

  resources :paralavis
  resources :artifacts


  resources :members
  get 'home/index'

   root :to => "home#index"

    
  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do   
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => { 
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions", 
    :passwords => "milia/passwords", 
  }


end
