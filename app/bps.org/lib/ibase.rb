module BPS
	module Base
		module IBase
			module Singleton_Methods
				def [](key)
					@store[key]
				end

				private
					def set key, value
						@store[key] = value
					end
			end
			
			
			def self.included(base)
				base.extend Singleton_Methods
				base.instance_variable_set :@store, {}
			end

			def self.includes_hooks?
		    	true
		  	end
	  	end
	end
end