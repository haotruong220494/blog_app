set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/var/www/blog_app"
server "13.229.81.48", :user => "ubuntu", :roles => %w(app db web)
