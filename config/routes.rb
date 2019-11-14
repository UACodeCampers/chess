Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
<<<<<<< HEAD
  resources :games
end
=======
end
>>>>>>> master
