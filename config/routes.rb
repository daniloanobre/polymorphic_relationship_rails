Rails.application.routes.draw do
  resources :pictures

  resources :authors do
    resources :pictures
    
    resources :books do
      resources :pictures
    end
  end
end
