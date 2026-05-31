Floridabiblestudy::Application.routes.draw do
  
  resources :events
  resources :faqs
  root :to => "welcome#index"
  get '/registration/register' => "registration#register"
  match ':controller(/:action(/:id(.:format)))', via: [:get, :post]
  
end
