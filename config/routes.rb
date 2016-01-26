Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :show, :destroy] do
    resources :contacts, only: [:index]
    resources :contacts do
      patch 'favorite', :on => :member
    end
  end
  resources :contacts, only: [:create, :update, :show, :destroy]
  resources :contact_shares, only: [:create, :destroy]

  # resources :contact_shares
  # get 'users/:id' => 'users#show', :as => 'user'
  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
end
