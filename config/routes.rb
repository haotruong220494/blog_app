Rails.application.routes.draw do
  devise_for :accounts, controllers: {omniauth_callbacks: "accounts/omniauth_callbacks"}

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
      member do
        delete :delete_image_attachment
      end
    end
    resources :categories do
      member do
        delete :delete_image_attachment
      end
    end
    resources :accounts
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboards#home_page"
  resources :posts, only: :show, param: :slug
  resources :categories, only: :show, param: :slug
  resources :comments, only: [:create, :destroy, :edit] do
    collection do
      get :show_subcomment
      post :create_subcomment
    end
  end
  get "/sitemap.xml", to: "sitemap#index", defaults: {format: "xml"}
  get "/robots.txt", to: "robots_txts#index"
end
