Rails.application.routes.draw do

  namespace :time_sheet, module: :time_sheet, path: '/' do
    resources :sheet, only: [:create, :show, :index] do
    end
  end

  resource :login, controller: :login, only: [:create, :destroy] do
    get '/' => :new
  end

  scope controller: :static, action: :show do
    get '/', id: 'home', as: :home
  end
end
