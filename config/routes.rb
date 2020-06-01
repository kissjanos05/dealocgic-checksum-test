Rails.application.routes.draw do

  root to: 'checksum#index'

  get  '/checksum' => 'checksum#index', as: :checksum
  post '/checksum' => 'checksum#create'

end
