module BPS
	module Sinatra
		module App
			module Actions

				include  Covered
				set_logger Log

				cover do
					def self.registered app



					end
				end

			end
		end
	end
end