Rails.application.routes.draw do
  scope controller: 'static', action: 'show' do
    get '/', id: 'home', as: :home
  end
end
