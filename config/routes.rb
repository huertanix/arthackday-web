ArthackdayWeb::Application.routes.draw do
  resources :media

  devise_for :organizers
  
  resources :press_blurbs

  resources :sponsors

  resources :participants

  resources :projects

  resources :venues

  resources :events

  resources :admin

  resources :about

  # contact page
  resources :messages, only: [:index, :create]
  get 'contact' => "messages#index"

  # organizer admin pages
  resources :organizers, only: [:index, :edit, :update]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # SEO-friendly support for old website URLs
  
  # Event pages
  get '319scholes', to: redirect('/events/hackers-as-artists')
  get 'big_bad_lab', to: redirect('/events/tech-not-bribes-art-for-suffrage')
  get 'gaffta', to: redirect('/events/lethal-software')
  get 'god_mode', to: redirect('/events/god-mode')
  get 'stockholm', to: redirect('/events/larger-than-life')
  get 'berlin', to: redirect('/events/going-dark')
  get 'afterglow', to: redirect('/events/after-glow')
  # slug drama
  get 'disnovate', to: redirect('/events/disnovation')
  
  # Project pages

  # NOTE: Events after 319 were given their old ID + 100 in the new DB to avoid ID conflicts
  get 'project/:id', to: redirect('/projects/%{id}') # project URLs from first Art Hack Day at 319 Scholes
  get 'big_bad_lab/:id', to: redirect('/projects/1%{id}')
  get 'gaffta/:id', to: redirect('/projects/1%{id}')
  get 'god_mode/:id', to: redirect('/projects/1%{id}')
  # NOTE: Stockholm was the only event to have old IDs in the 100+ range, 
  # and since you can't do math with route parms...
  #get 'stockholm/:id', to: redirect('/projects/' + (100 + '%{id}'.to_i).to_s) #fail
  #match 'stockholm/2:id*' => redirect('/projects/2%{id}') #fail
  #get 'stockholm/%{/^1?\d{2}$/}', to: redirect('/projects/1%{id}') #fail
  # two digit ID means we can "add" 100 by prepending with one
  get 'stockholm/:id', to: redirect('/projects/1%{id}'), :constraints => { :id => /\d{2}/ }
  # fuck it it's 1 am and regex can't be used to manipulate the ID, just filter it
  get 'stockholm/100', to: redirect('/projects/200')
  get 'stockholm/101', to: redirect('/projects/201')
  get 'stockholm/102', to: redirect('/projects/202')
  get 'stockholm/103', to: redirect('/projects/203')
  # 104 nevar forget
  get 'stockholm/105', to: redirect('/projects/205')
  get 'stockholm/106', to: redirect('/projects/206')
  get 'stockholm/107', to: redirect('/projects/207')
  get 'stockholm/108', to: redirect('/projects/208')
  get 'stockholm/109', to: redirect('/projects/209')

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
