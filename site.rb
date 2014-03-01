require 'bundler/setup'
Bundler.require(:default, :assets, ENV.fetch('RACK_ENV', :development).to_sym)

require_relative 'lib/wah_wah'
require_relative 'lib/flipper'

require 'sinatra/base'
require 'sinatra/asset_pipeline'


class Flippit < Sinatra::Base
  set :assets_css_compressor, :sass
  set :assets_js_compressor, :uglifier
  set :assets_precompile, %w(application.js styles.css *.png *.jpg *.svg *.eot *.ttf *.woff)

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
