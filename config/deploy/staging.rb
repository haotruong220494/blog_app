set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "46.137.215.4", :user => "ubuntu", :roles => %w(app db web)
