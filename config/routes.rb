Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, :path => "", :path_names => { :sign_in => "login", :sign_out => "logout" },
      :skip => [:registrations, :passwords]
    root "dashboards#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#home_page"
end
