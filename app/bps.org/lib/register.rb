module BPS
	module Sinatra_Register
		module Singleton_Methods

			def check_const const
			  	if const.split('::').first == 'App'
			  		Sinatra.const_get(const)
			  	else
			  		::Sinatra.const_get(const)
			  	end
			end


			def register_modules method, modules
				modules.each do |mod|
					self.send method, check_const(mod) 
				end
			end



		end

		def self.included(base)
			base.extend Singleton_Methods
		end

		def self.includes_hooks?
	    	%w(included)
	  	end
	end
end
