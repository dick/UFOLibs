class Main < Sinatra::Base

  helpers Sinatra::Partials

  configure do
    # Configure public directory
    set :public, File.dirname(__FILE__) + '/public'

    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
  end

  get '/' do
    haml :index
  end

  get "/css/style.css" do
    content_type 'text/css'
    sass :"css/style"
  end

end
