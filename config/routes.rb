Rails.application.routes.draw do
  # Home page
  root 'properties#index'
  get 'properties', to: 'properties#index', as: 'properties'

  # Updates demo data of properties
  patch 'update/properties', to: 'properties#update'
  patch 'all/properties', to: 'properties#update_all'

  # Create new property--also updates demo data after create
  patch 'new/properties', to: 'properties#new_property'

  # Deletes selected property
  delete 'delete/properties', to: 'properties#delete_property'

  # Resets all demo data back to 0
  post 'reset/properties', to: 'properties#reset_all'
end
