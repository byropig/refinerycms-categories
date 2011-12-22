::Refinery::Application.routes.draw do
  resources :categories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :categories, :except => :show do
      resources :products
      collection do
        post :update_positions
      end
    end
  end
end
