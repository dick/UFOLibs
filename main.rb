class Main < Sinatra::Base

  helpers Sinatra::Partials

  configure do
    # Configure HAML and SASS
    set :haml, {:format => :html5 }
    set :sass, {:style => :compressed }
  end

  get '/' do
    haml :index
  end

  get "/stylesheets/screen.css" do
    # Use views/stylesheets
    content_type 'text/css'
    sass :"css/screen"
  end

end
