module BPS
	class App < Sinatra_Mod
		include Sinatra_Register
		include Covered
		include Settings
		set_logger Log.logger

		cover :fatal do
		  	set :show_exceptions, true
		  	set :root, Info[:root]
		  	set :threaded, false
		  	# set :scss, Compass.sass_engine_options

		 	set :server, 'thin'
		  	Tilt.register Tilt::ERBTemplate, 'html.erb'


		  	# enable :logging
		  	# use Rack::CommonLogger, Log.file

		  	if ENV['ENVIRONMENT'] == :production
		    	# noinspection RailsParamDefResolve
		    	set :environment, :production
		    	# noinspection RailsParamDefResolve
		    	set :bind, Info[:host],Info[:port]
		    	set :show_exceptions, false
		  	end


		  	register_modules :helpers, Info[:helpers],Log.logger
		  	register_modules :register,Info[:register],Log.logger

		  	# alias_method :h, :escape_html

		  	setup_extentions_for self
		end
	end
end