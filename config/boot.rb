# Added to fix ActiveSupport::LoggerThreadSafeLevel::Logger
require 'logger'   # TODO: Remove once logger is autoloaded by Rails 

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
