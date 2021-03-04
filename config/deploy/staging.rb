set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "18.141.99.75", :user => "ubuntu", :roles => %w(app db web)
