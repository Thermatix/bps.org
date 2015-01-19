
module BPS
	module Covered
		module Singleton_Methods

			def set_logger logger
				@logger = logger
			end

			def logger
				@logger
			end

			def cover override=nil
				begin
					yield
				rescue Exception => err
					[
			            "#{err}",
			            "stacktrace=#{err.backtrace.join("\n")}"
			        ].each do |line|
			        	if override != :fatal
			        		puts line
			        	end
			        	logger.send override || :error, line
			        end
			        if override == :fatal
			        	raise 
			        end
				end
			end

		end

		def self.included(base)
			base.instance_variable_set :@logger, {}
			base.extend Singleton_Methods
		end

		def self.includes_hooks?
	    	%w(included)
	  	end

	end
end