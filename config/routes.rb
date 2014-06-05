Rails.application.routes.draw do
  resources :contacts

  root 'contacts#index'
end
