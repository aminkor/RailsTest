Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts
  resources :comments

  get 'top_five_posts', to: 'posts#top_five_posts'
end
