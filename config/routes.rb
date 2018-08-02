Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/blog',                  to: 'static_pages#blog'
  get     '/contact',               to: 'static_pages#contact'
  get     '/about',                 to: 'static_pages#about'

  get     '/participant_signup',    to: 'participants#new'
  get     '/login',                 to: 'sessions#new'
  post    '/login',                 to: 'sessions#create'
  delete  '/logout',                to: 'sessions#destroy'


  get     '/trips',                 to: 'static_pages#trips'
  get     '/trip/new',              to: 'trips#new'


  resources :participants
  resources :trips
  resources :media_contents, only: [:create]
end
