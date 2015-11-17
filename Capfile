# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
set :ssh_options, {:forward_agent => true}
set :repository,  "/home/deploy/repositories/stock"
set :local_repository, "ssh://deploy@46.101.78.138home/deploy/repositories/stock"