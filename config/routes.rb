Floridabiblestudy::Application.routes.draw do
  
  resources :events
  resources :faqs
  root :to => "welcome#index"
  match '/registration/register' => "registration#register"
  match ':controller(/:action(/:id(.:format)))'
  
end
