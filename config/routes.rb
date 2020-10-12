Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  namespace :admin do
    devise_for :admins, :path => "", :path_names => { :sign_in => "login", :sign_out => "logout" },
      :skip => [:registrations, :passwords]
    root "dashboards#index"
    resources :tags
    resources :posts do
      collection do
        get :load_tags
      end
    end
    resources :categories
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboards#home_page"
  resources :posts, only: :show, param: :slug
  resources :categories, only: :show, param: :slug
end
