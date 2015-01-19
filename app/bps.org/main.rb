module BPS
	class App < ::Sinatra::Base
		include Register
		include Covered
		cover do
		  	set :show_exceptions, true
		  	set :root, Info[:root]
		  	set :threaded, false
		  
		 	set :server, 'thin'
		  	Tilt.register Tilt::ERBTemplate, 'html.erb'

		  	enable :logging
		  	use Rack::CommonLogger, Log.file

		  	if ENV['ENVIRONMENT'] == :production
		    	# noinspection RailsParamDefResolve
		    	set :environment, :production
		    	# noinspection RailsParamDefResolve
		    	set :bind, Info[:host],Info[:port]
		    	set :show_exceptions, false
		  	end
		  	register_modules :helpers, Info[:helpers]
		  	register_modules :register,Info[:routing]
		end
	end
end