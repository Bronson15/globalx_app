Rails.application.routes.draw do
  get 'participants/new'
  root 'static_pages#home'
  get  '/blog',      to: 'static_pages#blog'
  get  '/trips',     to: 'static_pages#trips'
  get  '/contact',   to: 'static_pages#contact'
  get  '/about',     to: 'static_pages#about'
  get  '/user_signup',    to: 'users#new'
end
