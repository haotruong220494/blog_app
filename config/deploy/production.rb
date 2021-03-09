set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "54.179.60.241", :user => "ubuntu", :roles => %w(app db web)
