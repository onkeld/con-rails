Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    root "events#home"
    get "/pages/:id" => "high_voltage/pages#show", :as => :page, :format => false
    devise_for :users
    #namespace :admin do
    #  resources :events do
    #    resources :event_registrations
    #  end
    #end
    resources :events do
      collection do
        get 'home'
      end  
      resources :event_registrations do
        post 'mark_as_payed', on: :member
      end
    end
    resources :event_registrations do
      resources :participants, :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
