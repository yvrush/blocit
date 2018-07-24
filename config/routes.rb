Rails.application.routes.draw do

  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  resources :advertisements
  resources :questions
  resources :topics do
  resources :posts, except: [:index]
  resources :sponsored_posts, except: [:index]

  end
  resources :users, only: [:new, :create] do
    collection do
      post 'confirm'
    end
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
