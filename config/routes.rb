HelloWorkAPI::Application.routes.draw do
  root to: 'base#index'
  resources :jobs, only: [:show]
  scope ':pref' do
    get '/' => 'prefs#show', as: :pref
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
