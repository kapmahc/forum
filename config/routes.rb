Forum::Engine.routes.draw do
  scope '/:locale' do
    resources :articles do
      collection do
        get 'hot'
        get 'latest'
      end
    end
    resources :tags
    resources :comments do
      collection do
        get 'hot'
        get 'latest'
      end
    end
  end

  root 'articles#latest'
end
