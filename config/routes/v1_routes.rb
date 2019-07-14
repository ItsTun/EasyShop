scope "v1", defaults: {format: :json} do
  constraints subdomain: 'api'  do
    devise_scope :user do
      post "/login", to: "api/v1/sessions#create"
      delete "/logout", to: "api/v1/sessions#destroy"
      post "/register", to: "api/v1/registrations#create"
      # post "/set_email", to: "api/v1/registrations#set_email"
      # patch "/change_password", to: "api/v1/registrations#update"
      # put "/change_password", to: "api/v1/registrations#update"
      # post "/reset_password", to: "api/v1/passwords#create"
      # post "/validates_username", to: "api/v1/registrations#validates_username"
    end

    namespace :shop do
      get '/collection', to: "/api/v1/shop/collections#index"
      post '/:shop_id/collection', to: "/api/v1/shop/collections#create"
      get '/:shop_id/collection', to: "/api/v1/shop/collections#show"
    end
  end
end