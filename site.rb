require 'bundler/setup'
Bundler.require(:default)

require_relative 'lib/wah_wah'
require_relative 'lib/flipper'
require 'sinatra/asset_pipeline'
require 'sinatra/base'


class Flippit < Sinatra::Base
  register Sinatra::AssetPipeline
  include Flipper

  get '/' do
    haml :index
  end

  post '/get_flipped' do
    json output: flip_it(params[:string])
  end

  if app_file == $0
    run!
  end
end
