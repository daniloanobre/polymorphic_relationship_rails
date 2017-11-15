# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include default deployment tasks
require "capistrano/deploy"
 
# Include capistrano-rails
require 'capistrano/rails'
# require 'capistrano/rvm'
require 'capistrano/bundler'
# require 'capistrano/rails/migrations'

# If you are using rvm add these lines:
# require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.4.1'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
