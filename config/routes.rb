Rails.application.routes.draw do

  resource :login, controller: :login, only: [:create, :destroy] do
    get '/' => :new
  end

  scope controller: 'static', action: 'show' do
    get '/', id: 'home', as: :home
  end
end
