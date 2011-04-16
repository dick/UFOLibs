class Main < Sinatra::Base

  helpers Sinatra::Partials

  configure do
    # Configure public directory
    set :public, File.join(File.dirname(__FILE__), 'public')

    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
  end

	helpers do
		
		Chimps::Config.load

		def ufo_search(description, location)
			authenticated_request = Chimps::QueryRequest.new("science/astronomy/seti/nuforc/ufo_sightings_search")
		
		end

	end

  get '/' do
		@title = "Home" 
    haml :index
  end

	get '/:verb/:location' do
		results_json = ufo_search(params[:verb], params[:location])
		#results_json.each { |x| puts x["description"] }
	  @title = "#{params[:verb]}/#{params[:place]}"
		haml :index
	end

  get "/css/style.css" do
    content_type 'text/css'
    sass :"css/style"
  end

end
