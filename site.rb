require 'bundler/setup'
Bundler.require(:default, :assets)

require_relative 'lib/wah_wah'
require_relative 'lib/flipper'

require 'sinatra/base'
require 'sinatra/asset_pipeline'


class Flippit < Sinatra::Base
  set :assets_css_compressor, :sass
  set :assets_js_compressor, :uglifier

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
