Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/blog',                  to: 'static_pages#blog'
  get     '/trips',                 to: 'static_pages#trips'
  get     '/contact',               to: 'static_pages#contact'
  get     '/about',                 to: 'static_pages#about'
  get     '/participant_signup',    to: 'participants#new'
  get     '/login',                 to: 'sessions#new'
  post    '/login',                 to: 'sessions#create'
  delete  '/logout',                to: 'sessions#destroy'

  resources :participants
end
