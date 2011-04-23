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
			locations = ["CA", "Texas", "California", "Lubbock", "Roswell", "Flatwoods", "Phoenix", "TX"] 
	  	nouns = ["lights", "saucer", "probe", "UFO", "cigar", "abduction"]
	  	adjectives = ["bright", "green", "white", "flashing", "blue", "round", "brilliant"]
			verbs = ["saw", "heard", "witness", "experience", "experienced"] 	

			res = []
			res << verbs[rand(verbs.length)] << adjectives[rand(adjectives.length)] << nouns[rand(nouns.length)] << locations[rand(locations.length)]
			return res
		end
	end

  get '/' do
		@title = "UFOLibs - Are you alone?"
	  @random_sentence = random_sentence	
    haml :index
  end

  get '/css/style.css' do
    content_type 'text/css'
    sass :'css/style'
  end

	get '/find/*' do
		@search = ufo_search(params[:splat])
		# Pulling out the results array from the "data" hash returned
		@results_array = @search["results"]
		# Picking a random result for now to fit on the poster
		@result = @results_array[rand(@results_array.length)]
		# Pulling out the total results value from the "data" hash
	  @total_results = @search["total"]
	  @title = "UFOLibs - Are you alone?" 
		haml :display_results
	end

	post '/search' do
		# Fix for blank form values to avoid /// in url 
		string = params.values.join('/')
		string[/\/{2,}/] = "/" while string[/\{2,}/]
		redirect("/find/" + string)
	end

end
