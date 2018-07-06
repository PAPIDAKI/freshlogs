# == Route Map
#
#                           Prefix Verb   URI Pattern                                                          Controller#Action
#                     process_lots GET    /process_lots(.:format)                                              process_lots#index
#                                  POST   /process_lots(.:format)                                              process_lots#create
#                  new_process_lot GET    /process_lots/new(.:format)                                          process_lots#new
#                 edit_process_lot GET    /process_lots/:id/edit(.:format)                                     process_lots#edit
#                      process_lot GET    /process_lots/:id(.:format)                                          process_lots#show
#                                  PATCH  /process_lots/:id(.:format)                                          process_lots#update
#                                  PUT    /process_lots/:id(.:format)                                          process_lots#update
#                                  DELETE /process_lots/:id(.:format)                                          process_lots#destroy
#                       agreements GET    /agreements(.:format)                                                agreements#index
#                                  POST   /agreements(.:format)                                                agreements#create
#                    new_agreement GET    /agreements/new(.:format)                                            agreements#new
#                   edit_agreement GET    /agreements/:id/edit(.:format)                                       agreements#edit
#                        agreement GET    /agreements/:id(.:format)                                            agreements#show
#                                  PATCH  /agreements/:id(.:format)                                            agreements#update
#                                  PUT    /agreements/:id(.:format)                                            agreements#update
#                                  DELETE /agreements/:id(.:format)                                            agreements#destroy
#                 att_performances GET    /att_performances(.:format)                                          att_performances#index
#                                  POST   /att_performances(.:format)                                          att_performances#create
#              new_att_performance GET    /att_performances/new(.:format)                                      att_performances#new
#             edit_att_performance GET    /att_performances/:id/edit(.:format)                                 att_performances#edit
#                  att_performance GET    /att_performances/:id(.:format)                                      att_performances#show
#                                  PATCH  /att_performances/:id(.:format)                                      att_performances#update
#                                  PUT    /att_performances/:id(.:format)                                      att_performances#update
#                                  DELETE /att_performances/:id(.:format)                                      att_performances#destroy
#                    tenant_crates GET    /tenants/:tenant_id/crates(.:format)                                 crates#index
#                                  POST   /tenants/:tenant_id/crates(.:format)                                 crates#create
#                 new_tenant_crate GET    /tenants/:tenant_id/crates/new(.:format)                             crates#new
#                edit_tenant_crate GET    /tenants/:tenant_id/crates/:id/edit(.:format)                        crates#edit
#                     tenant_crate GET    /tenants/:tenant_id/crates/:id(.:format)                             crates#show
#                                  PATCH  /tenants/:tenant_id/crates/:id(.:format)                             crates#update
#                                  PUT    /tenants/:tenant_id/crates/:id(.:format)                             crates#update
#                                  DELETE /tenants/:tenant_id/crates/:id(.:format)                             crates#destroy
#                      tenant_pmus GET    /tenants/:tenant_id/pmus(.:format)                                   pmus#index
#                                  POST   /tenants/:tenant_id/pmus(.:format)                                   pmus#create
#                   new_tenant_pmu GET    /tenants/:tenant_id/pmus/new(.:format)                               pmus#new
#                  edit_tenant_pmu GET    /tenants/:tenant_id/pmus/:id/edit(.:format)                          pmus#edit
#                       tenant_pmu GET    /tenants/:tenant_id/pmus/:id(.:format)                               pmus#show
#                                  PATCH  /tenants/:tenant_id/pmus/:id(.:format)                               pmus#update
#                                  PUT    /tenants/:tenant_id/pmus/:id(.:format)                               pmus#update
#                                  DELETE /tenants/:tenant_id/pmus/:id(.:format)                               pmus#destroy
#                 tenant_purchases GET    /tenants/:tenant_id/purchases(.:format)                              purchases#index
#                                  POST   /tenants/:tenant_id/purchases(.:format)                              purchases#create
#              new_tenant_purchase GET    /tenants/:tenant_id/purchases/new(.:format)                          purchases#new
#             edit_tenant_purchase GET    /tenants/:tenant_id/purchases/:id/edit(.:format)                     purchases#edit
#                  tenant_purchase GET    /tenants/:tenant_id/purchases/:id(.:format)                          purchases#show
#                                  PATCH  /tenants/:tenant_id/purchases/:id(.:format)                          purchases#update
#                                  PUT    /tenants/:tenant_id/purchases/:id(.:format)                          purchases#update
#                                  DELETE /tenants/:tenant_id/purchases/:id(.:format)                          purchases#destroy
#                 tenant_paralavis GET    /tenants/:tenant_id/paralavis(.:format)                              paralavis#index
#                                  POST   /tenants/:tenant_id/paralavis(.:format)                              paralavis#create
#              new_tenant_paralavi GET    /tenants/:tenant_id/paralavis/new(.:format)                          paralavis#new
#             edit_tenant_paralavi GET    /tenants/:tenant_id/paralavis/:id/edit(.:format)                     paralavis#edit
#                  tenant_paralavi GET    /tenants/:tenant_id/paralavis/:id(.:format)                          paralavis#show
#                                  PATCH  /tenants/:tenant_id/paralavis/:id(.:format)                          paralavis#update
#                                  PUT    /tenants/:tenant_id/paralavis/:id(.:format)                          paralavis#update
#                                  DELETE /tenants/:tenant_id/paralavis/:id(.:format)                          paralavis#destroy
#                      tenant_lots GET    /tenants/:tenant_id/lots(.:format)                                   lots#index
#                                  POST   /tenants/:tenant_id/lots(.:format)                                   lots#create
#                   new_tenant_lot GET    /tenants/:tenant_id/lots/new(.:format)                               lots#new
#                  edit_tenant_lot GET    /tenants/:tenant_id/lots/:id/edit(.:format)                          lots#edit
#                       tenant_lot GET    /tenants/:tenant_id/lots/:id(.:format)                               lots#show
#                                  PATCH  /tenants/:tenant_id/lots/:id(.:format)                               lots#update
#                                  PUT    /tenants/:tenant_id/lots/:id(.:format)                               lots#update
#                                  DELETE /tenants/:tenant_id/lots/:id(.:format)                               lots#destroy
#              tenant_process_lots GET    /tenants/:tenant_id/process_lots(.:format)                           process_lots#index
#                                  POST   /tenants/:tenant_id/process_lots(.:format)                           process_lots#create
#           new_tenant_process_lot GET    /tenants/:tenant_id/process_lots/new(.:format)                       process_lots#new
#          edit_tenant_process_lot GET    /tenants/:tenant_id/process_lots/:id/edit(.:format)                  process_lots#edit
#               tenant_process_lot GET    /tenants/:tenant_id/process_lots/:id(.:format)                       process_lots#show
#                                  PATCH  /tenants/:tenant_id/process_lots/:id(.:format)                       process_lots#update
#                                  PUT    /tenants/:tenant_id/process_lots/:id(.:format)                       process_lots#update
#                                  DELETE /tenants/:tenant_id/process_lots/:id(.:format)                       process_lots#destroy
#             tenant_loose_berries GET    /tenants/:tenant_id/loose_berries(.:format)                          loose_berries#index
#                                  POST   /tenants/:tenant_id/loose_berries(.:format)                          loose_berries#create
#           new_tenant_loose_berry GET    /tenants/:tenant_id/loose_berries/new(.:format)                      loose_berries#new
#          edit_tenant_loose_berry GET    /tenants/:tenant_id/loose_berries/:id/edit(.:format)                 loose_berries#edit
#               tenant_loose_berry GET    /tenants/:tenant_id/loose_berries/:id(.:format)                      loose_berries#show
#                                  PATCH  /tenants/:tenant_id/loose_berries/:id(.:format)                      loose_berries#update
#                                  PUT    /tenants/:tenant_id/loose_berries/:id(.:format)                      loose_berries#update
#                                  DELETE /tenants/:tenant_id/loose_berries/:id(.:format)                      loose_berries#destroy
#                tenant_workgroups GET    /tenants/:tenant_id/workgroups(.:format)                             workgroups#index
#                                  POST   /tenants/:tenant_id/workgroups(.:format)                             workgroups#create
#             new_tenant_workgroup GET    /tenants/:tenant_id/workgroups/new(.:format)                         workgroups#new
#            edit_tenant_workgroup GET    /tenants/:tenant_id/workgroups/:id/edit(.:format)                    workgroups#edit
#                 tenant_workgroup GET    /tenants/:tenant_id/workgroups/:id(.:format)                         workgroups#show
#                                  PATCH  /tenants/:tenant_id/workgroups/:id(.:format)                         workgroups#update
#                                  PUT    /tenants/:tenant_id/workgroups/:id(.:format)                         workgroups#update
#                                  DELETE /tenants/:tenant_id/workgroups/:id(.:format)                         workgroups#destroy
#               tenant_shift_lists GET    /tenants/:tenant_id/shift_lists(.:format)                            shift_lists#index
#                                  POST   /tenants/:tenant_id/shift_lists(.:format)                            shift_lists#create
#            new_tenant_shift_list GET    /tenants/:tenant_id/shift_lists/new(.:format)                        shift_lists#new
#           edit_tenant_shift_list GET    /tenants/:tenant_id/shift_lists/:id/edit(.:format)                   shift_lists#edit
#                tenant_shift_list GET    /tenants/:tenant_id/shift_lists/:id(.:format)                        shift_lists#show
#                                  PATCH  /tenants/:tenant_id/shift_lists/:id(.:format)                        shift_lists#update
#                                  PUT    /tenants/:tenant_id/shift_lists/:id(.:format)                        shift_lists#update
#                                  DELETE /tenants/:tenant_id/shift_lists/:id(.:format)                        shift_lists#destroy
#               tenant_attendances GET    /tenants/:tenant_id/attendances(.:format)                            attendances#index
#                                  POST   /tenants/:tenant_id/attendances(.:format)                            attendances#create
#            new_tenant_attendance GET    /tenants/:tenant_id/attendances/new(.:format)                        attendances#new
#           edit_tenant_attendance GET    /tenants/:tenant_id/attendances/:id/edit(.:format)                   attendances#edit
#                tenant_attendance GET    /tenants/:tenant_id/attendances/:id(.:format)                        attendances#show
#                                  PATCH  /tenants/:tenant_id/attendances/:id(.:format)                        attendances#update
#                                  PUT    /tenants/:tenant_id/attendances/:id(.:format)                        attendances#update
#                                  DELETE /tenants/:tenant_id/attendances/:id(.:format)                        attendances#destroy
#         tenant_workers_packhouse GET    /tenants/:tenant_id/workers/packhouse(.:format)                      workers#index {:scope=>"packhouse"}
#            tenant_workers_fields GET    /tenants/:tenant_id/workers/fields(.:format)                         workers#index {:scope=>"fields"}
#                   tenant_workers GET    /tenants/:tenant_id/workers(.:format)                                workers#index {:scope=>"all_workers"}
#            import_tenant_workers POST   /tenants/:tenant_id/workers/import(.:format)                         workers#import
#                                  GET    /tenants/:tenant_id/workers(.:format)                                workers#index
#                                  POST   /tenants/:tenant_id/workers(.:format)                                workers#create
#                new_tenant_worker GET    /tenants/:tenant_id/workers/new(.:format)                            workers#new
#               edit_tenant_worker GET    /tenants/:tenant_id/workers/:id/edit(.:format)                       workers#edit
#                    tenant_worker GET    /tenants/:tenant_id/workers/:id(.:format)                            workers#show
#                                  PATCH  /tenants/:tenant_id/workers/:id(.:format)                            workers#update
#                                  PUT    /tenants/:tenant_id/workers/:id(.:format)                            workers#update
#                                  DELETE /tenants/:tenant_id/workers/:id(.:format)                            workers#destroy
#                          tenants GET    /tenants(.:format)                                                   tenants#index
#                                  POST   /tenants(.:format)                                                   tenants#create
#                       new_tenant GET    /tenants/new(.:format)                                               tenants#new
#                      edit_tenant GET    /tenants/:id/edit(.:format)                                          tenants#edit
#                           tenant GET    /tenants/:id(.:format)                                               tenants#show
#                                  PATCH  /tenants/:id(.:format)                                               tenants#update
#                                  PUT    /tenants/:id(.:format)                                               tenants#update
#                                  DELETE /tenants/:id(.:format)                                               tenants#destroy
#                   tenant_reports GET    /tenants/:tenant_id/reports(.:format)                                reports#index
#                                  POST   /tenants/:tenant_id/reports(.:format)                                reports#create
#                new_tenant_report GET    /tenants/:tenant_id/reports/new(.:format)                            reports#new
#               edit_tenant_report GET    /tenants/:tenant_id/reports/:id/edit(.:format)                       reports#edit
#                    tenant_report GET    /tenants/:tenant_id/reports/:id(.:format)                            reports#show
#                                  PATCH  /tenants/:tenant_id/reports/:id(.:format)                            reports#update
#                                  PUT    /tenants/:tenant_id/reports/:id(.:format)                            reports#update
#                                  DELETE /tenants/:tenant_id/reports/:id(.:format)                            reports#destroy
#                    tenant_palets GET    /tenants/:tenant_id/palets(.:format)                                 palets#index
#                                  POST   /tenants/:tenant_id/palets(.:format)                                 palets#create
#                 new_tenant_palet GET    /tenants/:tenant_id/palets/new(.:format)                             palets#new
#                edit_tenant_palet GET    /tenants/:tenant_id/palets/:id/edit(.:format)                        palets#edit
#                     tenant_palet GET    /tenants/:tenant_id/palets/:id(.:format)                             palets#show
#                                  PATCH  /tenants/:tenant_id/palets/:id(.:format)                             palets#update
#                                  PUT    /tenants/:tenant_id/palets/:id(.:format)                             palets#update
#                                  DELETE /tenants/:tenant_id/palets/:id(.:format)                             palets#destroy
#                  tenant_loadings GET    /tenants/:tenant_id/loadings(.:format)                               loadings#index
#                                  POST   /tenants/:tenant_id/loadings(.:format)                               loadings#create
#               new_tenant_loading GET    /tenants/:tenant_id/loadings/new(.:format)                           loadings#new
#              edit_tenant_loading GET    /tenants/:tenant_id/loadings/:id/edit(.:format)                      loadings#edit
#                   tenant_loading GET    /tenants/:tenant_id/loadings/:id(.:format)                           loadings#show
#                                  PATCH  /tenants/:tenant_id/loadings/:id(.:format)                           loadings#update
#                                  PUT    /tenants/:tenant_id/loadings/:id(.:format)                           loadings#update
#                                  DELETE /tenants/:tenant_id/loadings/:id(.:format)                           loadings#destroy
#           tenant_grower_position GET    /tenants/:tenant_id/growers/:grower_id/position(.:format)            growers#position
#   tenant_grower_position_current GET    /tenants/:tenant_id/growers/:grower_id/position/current(.:format)    growers#position {:scope=>"current"}
# tenant_grower_position_last_year GET    /tenants/:tenant_id/growers/:grower_id/position/last_year(.:format)  growers#position {:scope=>"last_year"}
#          tenant_grower_xposition GET    /tenants/:tenant_id/growers/:grower_id/xposition(.:format)           growers#xposition
#               tenant_grower_pmus GET    /tenants/:tenant_id/growers/:grower_id/pmus(.:format)                pmus#index
#                                  POST   /tenants/:tenant_id/growers/:grower_id/pmus(.:format)                pmus#create
#            new_tenant_grower_pmu GET    /tenants/:tenant_id/growers/:grower_id/pmus/new(.:format)            pmus#new
#           edit_tenant_grower_pmu GET    /tenants/:tenant_id/growers/:grower_id/pmus/:id/edit(.:format)       pmus#edit
#                tenant_grower_pmu GET    /tenants/:tenant_id/growers/:grower_id/pmus/:id(.:format)            pmus#show
#                                  PATCH  /tenants/:tenant_id/growers/:grower_id/pmus/:id(.:format)            pmus#update
#                                  PUT    /tenants/:tenant_id/growers/:grower_id/pmus/:id(.:format)            pmus#update
#                                  DELETE /tenants/:tenant_id/growers/:grower_id/pmus/:id(.:format)            pmus#destroy
#               tenant_grower_lots GET    /tenants/:tenant_id/growers/:grower_id/lots(.:format)                lots#index
#                                  POST   /tenants/:tenant_id/growers/:grower_id/lots(.:format)                lots#create
#            new_tenant_grower_lot GET    /tenants/:tenant_id/growers/:grower_id/lots/new(.:format)            lots#new
#           edit_tenant_grower_lot GET    /tenants/:tenant_id/growers/:grower_id/lots/:id/edit(.:format)       lots#edit
#                tenant_grower_lot GET    /tenants/:tenant_id/growers/:grower_id/lots/:id(.:format)            lots#show
#                                  PATCH  /tenants/:tenant_id/growers/:grower_id/lots/:id(.:format)            lots#update
#                                  PUT    /tenants/:tenant_id/growers/:grower_id/lots/:id(.:format)            lots#update
#                                  DELETE /tenants/:tenant_id/growers/:grower_id/lots/:id(.:format)            lots#destroy
#                   tenant_growers GET    /tenants/:tenant_id/growers(.:format)                                growers#index
#                                  POST   /tenants/:tenant_id/growers(.:format)                                growers#create
#                new_tenant_grower GET    /tenants/:tenant_id/growers/new(.:format)                            growers#new
#               edit_tenant_grower GET    /tenants/:tenant_id/growers/:id/edit(.:format)                       growers#edit
#                    tenant_grower GET    /tenants/:tenant_id/growers/:id(.:format)                            growers#show
#                                  PATCH  /tenants/:tenant_id/growers/:id(.:format)                            growers#update
#                                  PUT    /tenants/:tenant_id/growers/:id(.:format)                            growers#update
#                                  DELETE /tenants/:tenant_id/growers/:id(.:format)                            growers#destroy
#                                  GET    /tenants/:tenant_id/loadings(.:format)                               loadings#index
#                                  POST   /tenants/:tenant_id/loadings(.:format)                               loadings#create
#                                  GET    /tenants/:tenant_id/loadings/new(.:format)                           loadings#new
#                                  GET    /tenants/:tenant_id/loadings/:id/edit(.:format)                      loadings#edit
#                                  GET    /tenants/:tenant_id/loadings/:id(.:format)                           loadings#show
#                                  PATCH  /tenants/:tenant_id/loadings/:id(.:format)                           loadings#update
#                                  PUT    /tenants/:tenant_id/loadings/:id(.:format)                           loadings#update
#                                  DELETE /tenants/:tenant_id/loadings/:id(.:format)                           loadings#destroy
#            tenant_project_palets GET    /tenants/:tenant_id/projects/:project_id/palets(.:format)            palets#index
#                                  POST   /tenants/:tenant_id/projects/:project_id/palets(.:format)            palets#create
#         new_tenant_project_palet GET    /tenants/:tenant_id/projects/:project_id/palets/new(.:format)        palets#new
#        edit_tenant_project_palet GET    /tenants/:tenant_id/projects/:project_id/palets/:id/edit(.:format)   palets#edit
#             tenant_project_palet GET    /tenants/:tenant_id/projects/:project_id/palets/:id(.:format)        palets#show
#                                  PATCH  /tenants/:tenant_id/projects/:project_id/palets/:id(.:format)        palets#update
#                                  PUT    /tenants/:tenant_id/projects/:project_id/palets/:id(.:format)        palets#update
#                                  DELETE /tenants/:tenant_id/projects/:project_id/palets/:id(.:format)        palets#destroy
#          tenant_project_loadings GET    /tenants/:tenant_id/projects/:project_id/loadings(.:format)          loadings#index
#                                  POST   /tenants/:tenant_id/projects/:project_id/loadings(.:format)          loadings#create
#       new_tenant_project_loading GET    /tenants/:tenant_id/projects/:project_id/loadings/new(.:format)      loadings#new
#      edit_tenant_project_loading GET    /tenants/:tenant_id/projects/:project_id/loadings/:id/edit(.:format) loadings#edit
#           tenant_project_loading GET    /tenants/:tenant_id/projects/:project_id/loadings/:id(.:format)      loadings#show
#                                  PATCH  /tenants/:tenant_id/projects/:project_id/loadings/:id(.:format)      loadings#update
#                                  PUT    /tenants/:tenant_id/projects/:project_id/loadings/:id(.:format)      loadings#update
#                                  DELETE /tenants/:tenant_id/projects/:project_id/loadings/:id(.:format)      loadings#destroy
#                  tenant_projects GET    /tenants/:tenant_id/projects(.:format)                               projects#index
#                                  POST   /tenants/:tenant_id/projects(.:format)                               projects#create
#               new_tenant_project GET    /tenants/:tenant_id/projects/new(.:format)                           projects#new
#              edit_tenant_project GET    /tenants/:tenant_id/projects/:id/edit(.:format)                      projects#edit
#                   tenant_project GET    /tenants/:tenant_id/projects/:id(.:format)                           projects#show
#                                  PATCH  /tenants/:tenant_id/projects/:id(.:format)                           projects#update
#                                  PUT    /tenants/:tenant_id/projects/:id(.:format)                           projects#update
#                                  DELETE /tenants/:tenant_id/projects/:id(.:format)                           projects#destroy
#                                  GET    /tenants(.:format)                                                   tenants#index
#                                  POST   /tenants(.:format)                                                   tenants#create
#                                  GET    /tenants/new(.:format)                                               tenants#new
#                                  GET    /tenants/:id/edit(.:format)                                          tenants#edit
#                                  GET    /tenants/:id(.:format)                                               tenants#show
#                                  PATCH  /tenants/:id(.:format)                                               tenants#update
#                                  PUT    /tenants/:id(.:format)                                               tenants#update
#                                  DELETE /tenants/:id(.:format)                                               tenants#destroy
#                             root GET    /                                                                    home#index
#                          members GET    /members(.:format)                                                   members#index
#                                  POST   /members(.:format)                                                   members#create
#                       new_member GET    /members/new(.:format)                                               members#new
#                      edit_member GET    /members/:id/edit(.:format)                                          members#edit
#                           member GET    /members/:id(.:format)                                               members#show
#                                  PATCH  /members/:id(.:format)                                               members#update
#                                  PUT    /members/:id(.:format)                                               members#update
#                                  DELETE /members/:id(.:format)                                               members#destroy
#                       home_index GET    /home/index(.:format)                                                home#index
#         update_user_confirmation PUT    /user/confirmation(.:format)                                         confirmations#update
#                 new_user_session GET    /users/sign_in(.:format)                                             milia/sessions#new
#                     user_session POST   /users/sign_in(.:format)                                             milia/sessions#create
#             destroy_user_session DELETE /users/sign_out(.:format)                                            milia/sessions#destroy
#                    user_password POST   /users/password(.:format)                                            milia/passwords#create
#                new_user_password GET    /users/password/new(.:format)                                        milia/passwords#new
#               edit_user_password GET    /users/password/edit(.:format)                                       milia/passwords#edit
#                                  PATCH  /users/password(.:format)                                            milia/passwords#update
#                                  PUT    /users/password(.:format)                                            milia/passwords#update
#         cancel_user_registration GET    /users/cancel(.:format)                                              milia/registrations#cancel
#                user_registration POST   /users(.:format)                                                     milia/registrations#create
#            new_user_registration GET    /users/sign_up(.:format)                                             milia/registrations#new
#           edit_user_registration GET    /users/edit(.:format)                                                milia/registrations#edit
#                                  PATCH  /users(.:format)                                                     milia/registrations#update
#                                  PUT    /users(.:format)                                                     milia/registrations#update
#                                  DELETE /users(.:format)                                                     milia/registrations#destroy
#                user_confirmation POST   /users/confirmation(.:format)                                        confirmations#create
#            new_user_confirmation GET    /users/confirmation/new(.:format)                                    confirmations#new
#                                  GET    /users/confirmation(.:format)                                        confirmations#show
#

Rails.application.routes.draw do
  resources :process_lots
  resources :agreements
  resources :att_performances
  
  resources :tenants do 
    resources :crates
    resources :pmus
    resources :purchases
    resources :paralavis
    resources :lots
    
    resources :process_lots
    resources :loose_berries
  
    # workforce 
    resources :workgroups
    resources :shift_lists
    resources :attendances


    # resources :workers
    #sti
        # # get 'tanant/:id/workers' =>'workers#index'
        # resources :supervisors,controller:'workers',type: 'Supervisor'
        # resources :fields,controller:'workers',type: 'Field'
        # resources :packers,controller: 'workers',type: 'Packer'
        # resources :assistants ,controller: 'workers',type: 'Assistant'
        # resources :drivers,controller:'workers',type:'Driver'

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
