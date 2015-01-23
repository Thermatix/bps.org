
module Sinatra
	module App_Modules 
		module Helpers

			def render(*args)
		    	if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
		        	erb "_#{args.first[:partial]}".to_sym, :layout => false
		      	else
		        	super
		        end
		    end

		    def url_for name
				Route.instance_variable_get(
					:@routes
					)[name]
			end

		end
	end
	register App_Modules::Helpers
end

