scope 'v1', defaults: {format: :json} do
  constraints subdomain: 'api'  do
    devise_scope :user do
      post '/login', to: 'api/v1/sessions#create'
      delete '/logout', to: 'api/v1/sessions#destroy'
      post '/register', to: 'api/v1/registrations#create'
      # post '/set_email', to: 'api/v1/registrations#set_email'
      # patch '/change_password', to: 'api/v1/registrations#update'
      # put '/change_password', to: 'api/v1/registrations#update'
      # post '/reset_password', to: 'api/v1/passwords#create'
      # post '/validates_username', to: 'api/v1/registrations#validates_username'
    end

    namespace :shop do
      #home
      get '/:shop_id/collections', to: '/api/v1/shop/home#index'

      #collection
      get '/collection', to: '/api/v1/shop/collections#index'
      post '/:shop_id/collection', to: '/api/v1/shop/collections#create'
      get '/:shop_id/collection', to: '/api/v1/shop/collections#show'

      #product
      get '/:shop_id/products', to: '/api/v1/shop/products#index'
      post '/:shop_id/product', to: '/api/v1/shop/products#create'
      get '/:shop_id/product/:id', to: '/api/v1/shop/products#show'
      put '/:shop_id/product/:id', to: '/api/v1/shop/products#update'
      patch '/:shop_id/product/:id', to: '/api/v1/shop/products#update'
      delete '/:shop_id/product/:id', to: '/api/v1/shop/products#destroy'

      #images
      get '/:shop_id/product/:product_id/image/:image_id', to: '/api/v1/shop/images#show'
      delete '/:shop_id/product/:product_id/image/:image_id', to: '/api/v1/shop/images#destroy'

      #order
      get '/:shop_id/orders', to: '/api/v1/shop/orders#index'
      post '/:shop_id/order', to: '/api/v1/shop/orders#create'
      get '/:shop_id/order/:id', to: '/api/v1/shop/orders#show'
      put '/:shop_id/order/:id', to: '/api/v1/shop/orders#update'
      patch '/:shop_id/order/:id', to: '/api/v1/shop/orders#update'
      delete '/:shop_id/order/:id', to: '/api/v1/shop/orders#destroy'
      get '/:shop_id/delivery', to: '/api/v1/shop/orders#delivery'
      put '/:shop_id/delivery/:id', to: '/api/v1/shop/orders#choose_delivery'
      patch '/:shop_id/delivery/:id', to: '/api/v1/shop/orders#choose_delivery'

      #discount
      get '/:shop_id/discounts', to: '/api/v1/shop/discounts#index'
      post '/:shop_id/discount', to: '/api/v1/shop/discounts#create'
      put '/:shop_id/discount/:id', to: '/api/v1/shop/discounts#update'
      patch '/:shop_id/discount/:id', to: '/api/v1/shop/discounts#update'
      get '/:shop_id/discount/:id', to: '/api/v1/shop/discounts#show'
      delete '/:shop_id/discounts', to: '/api/v1/shop/discounts#destroy'

      #user
      get '/:shop_id/product/:id', to: '/api/v1/user/products#show'
      post '/:shop_id/order', to: '/api/v1/user/orders#create'
    end
  end
end