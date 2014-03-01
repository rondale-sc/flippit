require './site'
require 'sinatra/base'
require 'sinatra/asset_pipeline/task.rb'

Sinatra::AssetPipeline::Task.define! Flippit

if ENV['RACK_ENV'] == "test" || "development"
  load 'jasmine/tasks/jasmine.rake'
end
