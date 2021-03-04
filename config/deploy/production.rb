set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "54.169.118.131", :user => "ubuntu", :roles => %w(app db web)
