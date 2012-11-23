HelloWorkAPI::Application.routes.draw do
  root to: 'base#index'


  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
