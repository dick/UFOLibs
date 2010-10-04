class Main < Sinatra::Base

  helpers Sinatra::Partials

  configure do
    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
  end

  get '/' do
    #request.env['HTTP_USER_AGENT']
    haml :index
  end

  get %r{/css/(style|handheld|print).css} do
    content_type 'text/css'
    sass :"css/#{params[:captures].first}"
  end

  get "/css/handheld.css" do
    content_type 'text/css'
    sass :"css/handheld"
  end

end
