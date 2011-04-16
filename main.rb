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
		API_KEY = "dick-e9kYKOdVF-HA7sPuwC2RJT9Hz69"
		def ufo_search(description, place)
			url = 'http://api.infochimps.com/science/astronomy/seti/nuforc/ufo_sightings_search?q=' +
											  'description:' + description +
												'&location:' + location + 
												'&apikey=' + API_KEY
			buffer = open(url, "UserAgent" => "Ruby-Wget").read
			results = JSON.parse(buffer)
			return results	
		end
	end

  get '/' do
    haml :index
  end

	get '/:verb/:place' do
		results_json = ufo_search(params[:verb], params[:place])
		results_json.each { |x| puts x["description"] } 
	end

  get "/css/style.css" do
    content_type 'text/css'
    sass :"css/style"
  end

end
