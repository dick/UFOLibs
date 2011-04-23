require 'chimps'

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

		def ufo_search(descriptions)
			query_string = descriptions.inject("") { |memo, term| 
							memo += term
							memo += "&"
			}
			results = Chimps::QueryRequest.new("science/astronomy/seti/nuforc/ufo_sightings_search", :query_params => { "q" => query_string } ) 
			p results
			return results.get.parse!.data	
		end
	
		def random_sentence
			locations = ["Lubbock", "Roswell", "Flatwoods", "Phoenix", "TX"] 
	  	nouns = ["lights", "saucer", "probe", "UFO", "cigar", "abduction"]
	  	adjectives = ["bright", "green", "white", "flashing", "blue", "round", "brilliant"]
			verbs = ["saw", "heard", "abduct", "witness", "experience", "experienced"] 	

			res = []
			res << verbs[rand(verbs.length)] << adjectives[rand(adjectives.length)] << nouns[rand(nouns.length)] << locations[rand(locations.length)]
			return res
		end
	end

  get '/' do
		@title = "Home"
	  @random_sentence = random_sentence	
    haml :index
  end

  get '/css/style.css' do
    content_type 'text/css'
    sass :'css/style'
  end

	get '/find/*' do
		@search = ufo_search(params[:splat])
		@results_array = @search["results"]
		@result = @results_array[rand(@results_array.length)]
	  @total_results = @search["total"]
	  @title = "UFOLibs:" + params[:splat].join('/') 
		haml :display_results
	end

	post '/search' do
		string = params.values.join('/')
		redirect("/find/" + string)
	end

end
