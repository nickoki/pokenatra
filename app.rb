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

# READ
get "/pokedex" do
	@pokemon = Pokemon.all
	erb :"pokemon/pokedex"
end

get "/pokedex/add" do
	erb :"pokemon/add"
end

get "/pokedex/:name" do
	@pokemon = Pokemon.find_by name: params[:name].capitalize
	erb :"pokemon/show"
end

get "/pokedex/:name/edit" do
	@pokemon = Pokemon.find_by name: params[:name].capitalize
	erb :"pokemon/edit"
end

# CREATE
post "/pokedex" do
	@pokemon = Pokemon.create params[:pokemon]
	redirect "/pokedex"
end

# UPDATE
put "/pokedex/:name" do
	@pokemon = Pokemon.find_by name: params[:name].capitalize
	@pokemon.update params[:pkmn]
	redirect "/pokedex/#{@pokemon.name}"
end

# DELETE
delete "/pokedex/:name" do
	@pokemon = Pokemon.find_by name: params[:name].capitalize
	@pokemon.destroy
	redirect "/pokedex"
end
