Forum::Engine.routes.draw do
  get 'comments/index'

  get 'tags/index'

  get 'articles/index'

  get 'dashboard' => 'home#dashboard'

  root 'home#index'
end
