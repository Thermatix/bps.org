module BPS
	module ::Sinatra
		module App
			module Helpers

				def render(*args)
			    	if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
			        	erb "_#{args.first[:partial]}".to_sym, :layout => false
			      	else
			        	super
			        end
			    end

			end

		end
		register App::Helpers
	end
end
