module Zeeb
	module Sinatra_Register
		module Singleton_Methods

			def check_const const
			  	if const.split('::').first == 'App'
			  		BPS.const_get(const)
			  	else
			  		::Sinatra.const_get(const)
			  	end
			end


			def register_modules method, modules, logger
				modules.each do |mod|
					msg = "registering #{mod}"
					puts msg
					self.logger.info msg if self.logger
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
	class Zeeb < ::Sinatra::Base
		include Sinatra_Register
	end
end
