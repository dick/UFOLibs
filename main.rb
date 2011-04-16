require 'chimps'

Chimps.boot!
Chimps.config[:query][:key] = "dick-e9kYKOdVF-HA7sPuwC2RJT9Hz69"

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

		def ufo_search(description, location, size)
			results = Chimps::QueryRequest.new("science/astronomy/seti/nuforc/ufo_sightings_search", :query_params => { "q" => "description:#{description} AND location:#{location} AND size:#{size}" } ) 
			p results
			return results.get.parse!.body	
		end

	end

  get '/' do
		@title = "Home" 
    haml :index
  end

	get 'find/:verb/:location' do
		@results = ufo_search(params[:verb], params[:location], 5)
	  @title = "#{params[:verb]}/#{params[:location]}"
		haml :display_results
	end

  get "/css/style.css" do
    content_type 'text/css'
    sass :"css/style"
  end

end
