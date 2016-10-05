require "active_record"
require "sinatra"
require "sinatra/reloader"


# Load the file to connect to the DB
require_relative "db/connection"

# Load models
require_relative "models/artist"
require_relative "models/song"
