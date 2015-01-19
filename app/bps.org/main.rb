module BPS
	class App < ::Sinatra::Base
		include Sinatra_Register
		include Covered

		set_logger Log.logger

		cover :fatal do
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

		  	assets do
		  		serve '/javascripts', from: "#{Info[:public]}/javascripts"
		  		serve '/css',  from: "#{Info[:public]}/css"
		  		serve '/images', from: "#{Info[:public]}/images"

		  		css_compression :sass
		  		js_compression  :yui, :munge => true 
		  	end
		end
	end
end