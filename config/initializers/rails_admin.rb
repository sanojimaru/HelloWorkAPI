RailsAdmin.config do |config|
  config.main_app_name = ['Hello Work API', 'Admin']
  config.current_user_method { current_admin }
  config.authorize_with :cancan
end
