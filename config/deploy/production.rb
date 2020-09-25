set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/home/haotruong/deploy/demo_danghh"
server "13.212.124.252", user: "haotruong", roles: %w{app db web}
