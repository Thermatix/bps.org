module BPS
	class App < ::Sinatra::Base
	  set :show_exceptions, true
	  set :root, Info[:root]
	  set :threaded, false
	  
	  set :server, 'thin'
	  Tilt.register Tilt::ERBTemplate, 'html.erb'

	  enable :logging
	  use Rack::CommonLogger, Log.file

	  if ENV['JG_APPLICATION_NAME']
	    # noinspection RailsParamDefResolve
	    set :environment, :production
	    # noinspection RailsParamDefResolve
	    set :bind, '0.0.0.0', HOST
	    set :show_exceptions, false
	  end

	  Info[:helpers].each do |helper|
	  	helpers Sinatra.const_get(helper)
	  end

	  Info[:routing].each do | route_controller|
	  	register Sinatra.const_get(route_controller)
	  end

	end
end