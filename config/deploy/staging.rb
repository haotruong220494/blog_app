set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "52.77.77.137", :user => "ubuntu", :roles => %w(app db web)
