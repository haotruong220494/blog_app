set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "3.0.97.1", :user => "ubuntu", :roles => %w(app db web)
