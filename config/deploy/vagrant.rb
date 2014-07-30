# This configuration use ssh copy to deploy the application
# to the vagrant machine provisioned for the bebox_simple_web_app,

set :stage, :vagrant
set :user, "simple_web_app"
set :group, "simple_web_app"
# the ssh_key used here is the same that the provided by the bebox_simple_web_app project.
set :ssh_key, "config/keys/environments/vagrant/id_rsa"
set :copy_exclude, [".git", ".gitignore", ".gitmodules", "tmp", "log", '.idea', '.bundle']
set :deploy_to, "/home/simple_web_app/code"
set(:deploy_via, :copy)
set :scm, :none
set :repository, "."

set :ssh_options, {
  :keys => ssh_key,
  :port => '22',
  :forward_agent => 'true'
}

server "node1.server1.test", :web, :app, :db