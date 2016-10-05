ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "pokenatra_db"
)

# Override Active Record pluralization for "pokemon" to "pokemons"
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'pokemon', 'pokemon'
end

if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
