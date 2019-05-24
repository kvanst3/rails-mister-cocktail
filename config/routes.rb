Rails.application.routes.draw do
  # get 'doses/index'
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/show'
  # get 'doses/edit'
  # get 'doses/update'
  # get 'doses/destroy'
  # get 'ingredients/index'
  # get 'ingredients/new'
  # get 'ingredients/create'
  # get 'ingredients/show'
  # get 'ingredients/edit'
  # get 'ingredients/update'
  # get 'ingredients/destroy'
  # get 'cocktails/index'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # get 'cocktails/show'
  # get 'cocktails/edit'
  # get 'cocktails/update'
  # get 'cocktails/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
    collection do
      delete 'delete_img'
    end
  end
  resources :doses, only: [:destroy]
  # resources :ingredients
end
