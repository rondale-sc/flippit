require './site'
require 'sinatra/asset_pipeline/task.rb'
require 'rspec/core/rake_task'

Sinatra::AssetPipeline::Task.define! Flippit

require 'jasmine'
load 'jasmine/tasks/jasmine.rake'

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, "jasmine:ci"]
