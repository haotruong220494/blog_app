set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/home/haotruong/deploy/blog_app"
server "52.77.41.179", :user => "haotruong", :roles => %w(app db web)
