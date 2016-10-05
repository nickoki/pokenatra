require "active_record"
require "sinatra"
require "sinatra/reloader"

# Load the file to connect to the DB
require_relative "db/connection"

# Load models
require_relative "models/pokemon"



# ROUTES
get "/" do
	erb :"pokemon/index"
end

# READ all pokemon
get "/pokedex" do
	@pokemon = Pokemon.all
	erb :"pokemon/pokedex"
end

# READ individual pkmn
get "/pokedex/:name" do
	@pkmn = Pokemon.find_by name: params[:name].capitalize
	erb :"pokemon/show"
end

# CREATE

# UPDATE

# DELETE
