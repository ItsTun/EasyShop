# frozen_string_literal: true

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end
Rails.application.routes.draw do
  mount RailsEmailPreview::Engine, at: 'emails'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  draw :v1_routes
end
