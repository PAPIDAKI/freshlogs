Rails.application.routes.draw do
  resources :process_lots
  resources :agreements
  
  resources :tenants do 
    resources :crates
    resources :pmus
    resources :purchases
    resources :paralavis
    resources :lots
    
    resources :process_lots
    resources :loose_berries
      
    resources :attendances
    # workforce 
    resources :workgroups
    resources :shift_lists 
     resources :workers do 
        resources :attendances
        end
    #sti
        # # get 'tanant/:id/workers' =>'workers#index'
         resources :supervisors,controller:'workers',type: 'Supervisor'
         resources :fields,controller:'workers',type: 'Field'
         resources :packers,controller: 'workers',type: 'Packer'
         resources :assistants ,controller: 'workers',type: 'Assistant'
         resources :drivers,controller:'workers',type:'Driver'

     get 'workers/packhouse'=>'workers#index',scope: 'packhouse'
     get 'workers/fields'=>'workers#index',scope: 'fields'
     get 'workers'=>'workers#index',scope: 'all_workers'

    #importing  workers 
    resources :workers do
        collection{ post :import }
      end
  end 


  resources :tenants do
      resources :reports
      resources :palets
      resources :loadings
      resources :growers do
         get 'position' => "growers#position"
         get 'position/current' => "growers#position" ,scope:'current'
         get 'position/last_year' =>"growers#position",scope:'last_year' 
        get :xposition
        resources :pmus 
              resources :lots  
      end

      resources :loadings
    resources :projects do 
      resources :palets
      resources :loadings
    end

  end

  # resources :paralavis
  # resources :artifacts

   root :to => "home#index"

  resources :members
  get 'home/index'


    
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
