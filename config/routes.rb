Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/show'
  get 'attendances/update'
  get 'attendances/destroy'
  get 'events/new'
  get 'events/create'
  get 'events/destroy'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
